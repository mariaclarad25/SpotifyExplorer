//
//  SpotifyArtistAPI.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 19/08/25.
//

import Foundation

extension SpotifyAPI {
    func searchArtists(query: String) async throws -> [Artist] {
        let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        
        guard let url = URL(string: "https://api.spotify.com/v1/search?q=\(encoded)&type=artist&limit=35")
        else { throw SpotifyError.invalidURL }
        
        let data = try await performRequest(url: url)
        let result = try decode(SpotifySearchArtistResponse.self, from: data)
        return result.artists.items
    }
    
    func getArtistTopTracks(artistId: String, market: String = "BR") async throws -> [Track] {
           guard let url = URL(string: "https://api.spotify.com/v1/artists/\(artistId)/top-tracks?market=\(market)")
           else { throw SpotifyError.invalidURL }
           
           let data = try await performRequest(url: url)
           struct TopTracksResponse: Codable { let tracks: [Track] }
           let result = try decode(TopTracksResponse.self, from: data)
           return result.tracks
       }
    
    func getArtistAlbums(artistId: String) async throws -> [Album] {
         guard let url = URL(string: "https://api.spotify.com/v1/artists/\(artistId)/albums?include_groups=album,single&limit=30")
         else { throw SpotifyError.invalidURL }
         
         let data = try await performRequest(url: url)
         struct AlbumsResponse: Codable { let items: [Album] }
         let result = try decode(AlbumsResponse.self, from: data)
         return result.items
     }
}
