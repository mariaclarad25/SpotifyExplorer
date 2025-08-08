//
//  Tracks.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 08/08/25.
//

import Foundation

struct Track: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let previewUrl: String?
    let albumName: String
    let image: String
    let spotifyUrl: String
}
