//
//  Track.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct Track: Identifiable, Codable {
    let id: String
    let name: String
    let artists: [Artist]?
    let album: Album?
    let popularity: Int?
    let durationMs: Int? 
    let externalUrls: SpotifyExternalURLs?
    
    enum CodingKeys: String, CodingKey {
        case id, name, artists, album, popularity
        case durationMs = "duration_ms"
        case externalUrls = "external_urls"
    }
}
