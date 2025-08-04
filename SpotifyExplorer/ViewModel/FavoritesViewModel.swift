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
        if favoriteArtists.contains(artist) {
            favoriteArtists.removeAll { $0 == artist }
        } else {
            favoriteArtists.append(artist)
        }
    }
    
    func isFavorite(_ artist: Artist) -> Bool {
        return favoriteArtists.contains(artist)
    }
}
