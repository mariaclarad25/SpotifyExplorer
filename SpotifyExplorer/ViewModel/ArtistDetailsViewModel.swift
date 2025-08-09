//
//  ArtistDetailsViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import Foundation

final class ArtistDetailsViewModel: ObservableObject {
    let artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    var albumsForArtist: [Album] {
        MockData.sampleAlbums.filter { $0.artistId == artist.id }
    }
    
    var tracksForArtist: [Track] {
        MockData.sampleTracks
                .filter { $0.artistId == artist.id }
                .sorted { $0.popularity > $1.popularity } //ordena por popularidade decrescente
                .prefix(5)
                .map { $0 }
    }
    
    func tracksForAlbum(_ albumId: String) -> [Track] {
        MockData.sampleTracks
            .filter { $0.albumId == albumId }
    }
}
