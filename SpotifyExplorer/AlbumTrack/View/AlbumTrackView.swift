//
//  AlbumTrackView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import SwiftUI

struct AlbumTrackView: View {
    @StateObject private var viewModel: AlbumTrackViewModel
    let album: Album
    
    init(album: Album) {
        self.album  = album
        _viewModel = StateObject(wrappedValue: AlbumTrackViewModel(album: album))
    }
    
    var body: some View {
        ZStack{
            Color(.darkPurple).ignoresSafeArea()
            ShimmerEffect()
            
            VStack(spacing: 16) {
                albumName
                
                if viewModel.tracks.isEmpty {
                    Spacer()
                    
                    emptyTrackList
                    
                    Spacer()
                } else {
                    trackList
                }
            }
            .navigationTitle("Faixas do Álbum")
        }
    }
}

// MARK: - Components
private extension AlbumTrackView {
    var albumName: some View {
        Text(album.name)
            .styleTitleSheet()
    }
}

// MARK: - States
private extension AlbumTrackView {
    var trackList: some View { 
        ScrollView{
            VStack(spacing: 6) {
                ForEach(viewModel.tracks) { track in
                    CardTracks(track: track)
                }
            }
            .padding()
        }
    }
    
    var emptyTrackList: some View {
        VStack(spacing: 16) {
            Image(systemName: "music.note")
                .font(.system(size: 35))
                .foregroundColor(.gray)
            
            Text(viewModel.errorMessage ?? "")
                .foregroundColor(.white)
                .font(.system(size: 18).weight(.semibold))
        }
    }
}

#Preview {
    let album = PreviewData.sampleAlbums[0]    
    return AlbumTrackView(album: album)
}
