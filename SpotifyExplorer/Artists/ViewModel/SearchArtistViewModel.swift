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
    @Published var isLoadingDiscovery: Bool = true
    @Published var errorMessage: String?
    @Published var featuredArtists: [Artist] = []
    @Published var recommendedArtist: [Artist] = []
    @Published var didPerformSearch: Bool = false
    @Published var showingSearchResults: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    var searchTask: Task<Void, Never>?
    
    private var normalizedSearchText: String {
        searchText.trimmingCharacters(in: .whitespaces).lowercased()
    }
    
    init() {
        setupSearchBinding()
        loadDiscoveryData()
    }
    
    // MARK: - Search
    private func setupSearchBinding() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self else { return }
                
                if text.isEmpty {
                    self.resetSearch()
                } else {
                    self.showingSearchResults = true
                    self.performSearch(query: self.normalizedSearchText)
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
        searchTask?.cancel()
        isLoading = true
        errorMessage = nil
        
        searchTask = Task {
            isLoading = true
            defer { self.isLoading = false }
            
            do {
                guard !Task.isCancelled else { return }
                
                let results = try await SpotifyAPI.shared.searchArtists(query: query)
                
                guard !Task.isCancelled else { return }
                
                self.searchResults = results
                self.didPerformSearch = false
                
                if results.isEmpty {
                    self.errorMessage = "Nenhum resultado encontrado"
                }
                
            } catch {
                guard !Task.isCancelled else { return }
                self.searchResults = []
                self.errorMessage = "Erro na busca"
            }
        }
    }
    
    // MARK: - Discovery
    private func loadDiscoveryData() {
        Task {
            isLoadingDiscovery = true
            defer { isLoadingDiscovery = false }
            
            do {
                let searchTerm = "pop music"
                let results = try await SpotifyAPI.shared.searchArtists(query: searchTerm)
                
                self.featuredArtists = results.filter(Self.isFeatured)
                self.recommendedArtist = results.filter(Self.isRecommended)
                
            } catch {
                print("Erro ao carregar dados de descoberta: \(error)")
            }
        }
    }
    
    // MARK: - Filtering helpers
    private nonisolated static func isFeatured(_ artist: Artist) -> Bool {
        let popularity = artist.popularity ?? 0
        return popularity >= 72
    }
    
    private nonisolated static func isRecommended(_ artist: Artist) -> Bool {
        let popularity = artist.popularity ?? 0
        return popularity > 35 && popularity < 70
    }
}
