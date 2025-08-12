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
        PreviewData.sampleAlbums.filter { $0.artistId == artist.id }
    }
    
    var topTracksForArtist: [Track] {
        Array(
        PreviewData.sampleTracks
                .filter { $0.artistId == artist.id }
                .sorted(by: { $0.popularity > $1.popularity })
                .prefix(5)
        )
    }
    
    func tracksForAlbum(_ albumId: String) -> [Track] {
        PreviewData.sampleTracks
            .filter { $0.albumId == albumId }
    }
}
