//
//  Album.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct Album: Identifiable, Codable {
    let id: String
    let name: String
    let images: [SpotifyImage]?
    let artists: [Artist]?
    let releaseDate: String?
    let totalTracks: Int?
}

enum CodingKeys: String, CodingKey {
    case id, name, images, artists
    case releaseDate = "release_date"
    case totalTracks = "total_tracks"
}
