//
//  SpotifySharedModels.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 15/08/25.
//

import Foundation

struct SpotifyImage: Codable {
    let url: String
    let height: Int?
    let width: Int?
}

struct SpotifyExternalURLs: Codable {
    let spotify: String
}

struct Followers: Codable {
    let href: String?
    let total: Int
}
