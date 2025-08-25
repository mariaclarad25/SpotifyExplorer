//
//  SpotifyAPIResponse.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 15/08/25.
//

import Foundation

struct SpotifySearchTrackResponse: Codable {
    let tracks: TrackPage
}

struct TrackPage: Codable {
    let items: [Track]
}

struct SpotifySearchArtistResponse: Codable {
    let artists: ArtistPage
}

struct ArtistPage: Codable {
    let items: [Artist]
}
