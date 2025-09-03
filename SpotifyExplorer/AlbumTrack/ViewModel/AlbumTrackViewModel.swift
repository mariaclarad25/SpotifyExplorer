//
//  AlbumTrackViewModel.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 18/08/25.
//

import Foundation

@MainActor
class AlbumTrackViewModel: ObservableObject {
    @Published var album: Album
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(album: Album) {
        self.album = album
        fetchTracks()
    }
    
    func fetchTracks() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                let simpleTracks = try await SpotifyAPI.shared.getAlbumTracks(albumId: album.id)
                
                let detailedTracks: [Track] = try await fetchTrackDetails(for: simpleTracks)
                
                self.tracks = tracksByPopularity(detailedTracks)
                
                if self.tracks.isEmpty {
                    self.errorMessage = "Este álbum não possui faixas disponíveis."
                }
                
            } catch {
                self.tracks = []
                self.errorMessage = "\(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
    
    private func fetchTrackDetails(for tracks: [Track]) async throws -> [Track] {
        try await withThrowingTaskGroup(of: Track.self) { group in
            for track in tracks {
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
    }
}
