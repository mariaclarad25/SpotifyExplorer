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
                async let tracksResult = SpotifyAPI.shared.getArtistTopTracks(artistId: artist.id)
                async let albumsResult = SpotifyAPI.shared.getArtistAlbums(artistId: artist.id)
                
                let fetchedTracks = try await tracksResult
                self.topTracks = Array(fetchedTracks.sorted { $0.popularity ?? 0 > $1.popularity ?? 0 }.prefix(10))
                self.albums = try await albumsResult
                
            } catch let spotifyError as SpotifyError {
                self.errorMessage = "Falha ao carregar dados: \(spotifyError.errorDescription ?? "Erro desconhecido")"
            } catch {
                self.errorMessage = "Falha ao carregar dados: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
}
