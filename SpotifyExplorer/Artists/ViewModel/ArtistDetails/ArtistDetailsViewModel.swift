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
                let fetchedTracks = try await fetchTopTracks()
                
                self.topTracks = tracksByPopularity(fetchedTracks)
                
                self.albums = try await SpotifyAPI.shared.getArtistAlbums(artistId: artist.id)
                
                
            } catch let spotifyError as SpotifyError {
                self.errorMessage = "Falha ao carregar dados: \(spotifyError.errorDescription ?? "Erro desconhecido")"
            } catch {
                self.errorMessage = "Falha ao carregar dados: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
    
    private func fetchTopTracks()  async throws -> [Track] {
        let fetchedTracks = try await SpotifyAPI.shared.getArtistTopTracks(artistId: artist.id)
        
        let detailedTracks: [Track] = try await withThrowingTaskGroup(of: Track.self) { group in
            for track in fetchedTracks {
                group.addTask {
                    try await SpotifyAPI.shared.getTrack(trackId: track.id)
                }
            }
            
            var results: [Track] = []
            for try await track in group {
                results.append(track)
            }
            return results
        }
        
        return detailedTracks
    }
}
