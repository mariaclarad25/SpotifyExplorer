//
//  GenreArtistsViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 05/08/25.
//

import Foundation
import SwiftUI

class GenrerAtistsViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    @Published var isLoading = false
    
    private let selectedGenre: String
    
    init(genre: String) {
        self.selectedGenre = genre
        loadArtists()
    }
    
    private func loadArtists() {
        isLoading = true
        // Simula um delay de rede (remova quando usar API real)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Filtra artistas que contêm o gênero selecionado (case insensitive)
            self.artists = MockData.sampleArtist.filter { artist in
                artist.genres.contains { genre in
                    genre.lowercased().contains(self.selectedGenre.lowercased()) ||
                    self.selectedGenre.lowercased().contains(genre.lowercased())
                }
            }
            self.isLoading = false
        }
    }
}
