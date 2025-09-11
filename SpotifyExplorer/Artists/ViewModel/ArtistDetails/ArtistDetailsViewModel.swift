//
//  ArtistDetailsViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import Foundation

@MainActor
final class ArtistDetailsViewModel: ObservableObject {
    let artist: Artist
    
    @Published var topTracks: [Track] = []
    @Published var albums: [Album] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    func fetchData() {
        guard topTracks.isEmpty && albums.isEmpty else { return }
        
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                async let fetchedAlbums = SpotifyAPI.shared.getArtistAlbums(artistId: artist.id)
                let fetchedTopTracks = try await SpotifyAPI.shared.getArtistTopTracks(artistId: artist.id)
                
                let trackIds = fetchedTopTracks.map { $0.id }
                
                let detailedTracks = try await SpotifyAPI.shared.getTrack(trackIds: trackIds)
                
                self.topTracks = tracksByPopularity(detailedTracks)
                self.albums = try await fetchedAlbums
                
            } catch let spotifyError as SpotifyError {
                self.errorMessage = "Falha ao carregar dados: \(spotifyError.errorDescription ?? "Erro desconhecido")"
            } catch {
                self.errorMessage = "Falha ao carregar dados: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
}
