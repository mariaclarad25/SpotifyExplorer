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
    let images: [SpotifyImage]?
    let durationMs: Int?
    let externalUrls: SpotifyExternalURLs?
    
    enum CodingKeys: String, CodingKey {
        case id, name, artists, album, popularity, images
        case durationMs = "duration_ms"
        case externalUrls = "external_urls"
    }
    
    var imageURL: String? {
          return album?.images?.first?.url
      }
}
