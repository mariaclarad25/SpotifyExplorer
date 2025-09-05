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
                let fetchedTracks = try await SpotifyAPI.shared.getAlbumTracks(albumId: album.id)
                
                if fetchedTracks.isEmpty {
                    self.tracks = []
                    self.errorMessage = "Este álbum não possui faixas disponíveis."
                } else {
                    self.tracks = fetchedTracks
                }
                
            } catch {                
                self.tracks = []
                self.errorMessage = "Erro: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
}
