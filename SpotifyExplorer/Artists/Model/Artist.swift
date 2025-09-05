//
//  Artist.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct Artist: Codable, Identifiable {
    let id: String
    let name: String
    let genres: [String]?
    let images: [SpotifyImage]?
    let followers: Followers?
    let popularity: Int?
    let external_urls: SpotifyExternalURLs?
}
