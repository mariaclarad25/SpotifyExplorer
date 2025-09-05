//
//  GenreArtistsViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 05/08/25.
//

import Foundation
import SwiftUI

@MainActor
class GenrerAtistsViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let genre: String
    
    init(genre: String) {
        self.genre = genre
        fetchArtistsByGenre()
    }
    
    func fetchArtistsByGenre() {
        guard artists.isEmpty else { return }
        
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                let apiQuery = "genre: \(genre)"
                
                self.artists = try await SpotifyAPI.shared.searchArtists(query: apiQuery)
                
                if self.artists.isEmpty {
                    self.errorMessage = "Nenhum artista encontrado para o gênero '\(genre)'."
                }
                
            } catch {
                self.errorMessage = "Falha ao buscar artistas: \(error.localizedDescription)"
                self.artists = []
            }
            
            isLoading = false
        }
    }
}
