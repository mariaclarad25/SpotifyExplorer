//
//  Track.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct Track: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let previewUrl: String?
    let albumName: String
    let albumId: String
    let artistId: String
    let image: String
    let spotifyUrl: String
    let popularity: String
    let durationMs: Int
}
