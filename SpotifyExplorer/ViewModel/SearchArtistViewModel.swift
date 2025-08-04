//
//  SearchArtistViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 04/08/25.
//

import Foundation
import Combine

class SearchArtistViewModel: ObservableObject {
    @Published var allArtists: [Artist] = MockData.sampleArtist
    @Published var searchText: String = ""
    @Published var filteredArtists: [Artist] = []
    
    var popularArtist: [Artist] {
        allArtists.filter { $0.popularity >= 70 }
    }
    
    var newArtist: [Artist] {
        allArtists.filter { $0.popularity < 70 }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main) //evita filtro a cada letra digitada rápido
            .removeDuplicates()
        //transforma texto em lista filtrada de artistas
            .map { [weak self] text in
                guard let self = self else { return [] }
                if text.isEmpty {
                    return self.allArtists
                } else {
                    return self.allArtists.filter {
                        $0.name.lowercased().contains(text.lowercased()) || $0.genres.contains(where: { $0.lowercased().contains(text.lowercased()) })

                    }
                }
            }
            .assign(to: \.filteredArtists, on: self)
            .store(in: &cancellables)
    }
}

