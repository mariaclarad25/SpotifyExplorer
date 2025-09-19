//
//  SpotifyTracksAPI.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 19/08/25.
//

import Foundation

extension SpotifyAPI {
    
    func getTrack(trackIds: [String]) async throws -> [Track] {
        let idsString = trackIds.joined(separator: ",")
        guard let url = URL(string: "https://api.spotify.com/v1/tracks?ids=\(idsString)") 
        else { throw SpotifyError.invalidURL }
        
        let data = try await performRequest(url: url)
        struct Response: Codable { let tracks: [Track] }
        let result = try decode(Response.self, from: data)
        return result.tracks
    }
    
    func getAlbumTracks(albumId: String) async throws -> [Track] {
        guard let url = URL(string: "https://api.spotify.com/v1/albums/\(albumId)/tracks") 
        else { throw SpotifyError.invalidURL }
        
        let data = try await performRequest(url: url)
        struct AlbumTracksResponse: Codable { let items: [Track] }
        let result = try decode(AlbumTracksResponse.self, from: data)
        return result.items
    }
}
