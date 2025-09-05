//
//  SpotifyTracksAPI.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 19/08/25.
//

import Foundation

extension SpotifyAPI {
    
    func getAlbumTracks(albumId: String) async throws -> [Track] {
        guard let url = URL(string: "https://api.spotify.com/v1/albums/\(albumId)/tracks") else {
            throw SpotifyError.invalidURL
        }
        
        let data = try await performRequest(url: url)
        struct AlbumTracksResponse: Codable { let items: [Track] }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(AlbumTracksResponse.self, from: data)
        return result.items
    }
}
