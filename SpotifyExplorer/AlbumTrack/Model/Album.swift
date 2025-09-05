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
    let release_date: String?
    let total_tracks: Int?
    let artists: [Artist]?
}
