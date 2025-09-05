//
//  FavoritesViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 04/08/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favoriteArtists: [Artist] = []
    
    func toggleFavorite(for artist: Artist) {
        if favoriteArtists.contains(where: { $0.id == artist.id }) {
            favoriteArtists.removeAll { $0.id == artist.id }
        } else {
            favoriteArtists.append(artist)
        }
    }
    
    func isFavorite(_ artist: Artist) -> Bool {
        return favoriteArtists.contains(where: { $0.id == artist.id })
    }
}
