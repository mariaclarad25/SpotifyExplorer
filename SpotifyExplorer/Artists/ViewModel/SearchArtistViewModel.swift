//
//  SearchArtistViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 04/08/25.
//

import Foundation
import Combine

@MainActor
class SearchArtistViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [Artist] = []
    @Published var isLoading: Bool = false
    @Published var isSearching: Bool = false
    @Published var errorMessage: String?
    @Published var featuredArtists: [Artist] = []
    @Published var recommendedArtist: [Artist] = []
    @Published var didPerformSearch: Bool = false
    @Published var showingSearchResults: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var artistCache: [String: [Artist]] = [:]
    var searchTask: Task<Void, Never>?
    
    private var normalizedSearchText: String {
        searchText.trimmingCharacters(in: .whitespaces).lowercased()
    }
    
    init() {
        setupSearchBinding()
        loadDiscoveryData()
    }
    
    private func setupSearchBinding() {
        $searchText
            .sink { [weak self] text in
                guard let self = self else { return }
                
                if text.isEmpty {
                    self.resetSearch()
                } else {
                    self.showingSearchResults = true
                    if text.count >= 2 && !self.isLoading {
                        self.isLoading = true
                    }
                }
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                
                if text.isEmpty {
                    self.resetSearch()
                } else if text.count >= 2 {
                    self.performSearch(query: text)
                } else {
                    self.isLoading = false
                    self.searchResults = []
                    self.didPerformSearch = true
                }
            }
            .store(in: &cancellables)
    }
    
    private func resetSearch() {
        searchTask?.cancel()
        searchResults = []
        errorMessage = nil
        didPerformSearch = false
        isLoading = false
        showingSearchResults = false
    }
    
    private func performSearch(query: String) {
        let searchQuery = query.trimmingCharacters(in: .whitespaces).lowercased()
        
        searchTask?.cancel()
        
        if let cachedResults = artistCache[searchQuery] {
            self.searchResults = cachedResults
            self.isLoading = false
            self.errorMessage = cachedResults.isEmpty ? "Nenhum resultado encontrado" : nil
            return
        }
        
        self.isLoading = true
        self.errorMessage = nil
        
        searchTask = Task {
            do {
                guard !Task.isCancelled else { return }
                
                let results = try await SpotifyAPI.shared.searchArtists(query: searchQuery)
                
                guard !Task.isCancelled else { return }
                
                self.searchResults = results
                self.artistCache[searchQuery] = results
                self.isLoading = false
                
                if results.isEmpty {
                    self.errorMessage = "Nenhum resultado encontrado"
                }
                
            } catch {
                guard !Task.isCancelled else { return }
                
                self.searchResults = []
                self.errorMessage = "Erro na busca"
                self.isLoading = false
            }
        }
    }
    
    private func loadDiscoveryData() {
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                let featuredResults = try await SpotifyAPI.shared.searchArtists(query: "pop music")
                self.featuredArtists = featuredResults.filter { ($0.popularity ?? 0) >= 70 }
                
                let recommendedTalentsResults = try await SpotifyAPI.shared.searchArtists(query: "pop music")
                self.recommendedArtist = recommendedTalentsResults.filter { ($0.popularity ?? 0) > 30 && ($0.popularity ?? 0) < 70 }
                
                if self.recommendedArtist.count < 8 {
                    let alternativeQueries = ["new music", "emerging artists", "fresh pop", "rising artists"]
                    
                    for query in alternativeQueries {
                        let alternativeResults = try await SpotifyAPI.shared.searchArtists(query: query)
                        let additionalTalents = alternativeResults.filter {
                            ($0.popularity ?? 0) > 44 && ($0.popularity ?? 0) < 70
                        }
                        self.recommendedArtist.append(contentsOf: additionalTalents)
                        
                        if self.recommendedArtist.count >= 10 {
                            break
                        }
                    }
                }
            } catch {
                print("Erro ao carregar dados de descoberta: \(error)")
            }
        }
    }
    
    func clearCache() {
        artistCache.removeAll()
    }
}
