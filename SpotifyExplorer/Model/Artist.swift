//
//  Artist.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct Artist: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let image: String
    let imageLarge: String
    let imageBig: String
    let genres: [String]
    let followers: Int
    let popularity: Int
}
