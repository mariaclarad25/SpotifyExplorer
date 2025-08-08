//
//  Album.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 08/08/25.
//

import Foundation

struct Album: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let image: String
    let releaseDate: String
    let totalTracks: Int
}
