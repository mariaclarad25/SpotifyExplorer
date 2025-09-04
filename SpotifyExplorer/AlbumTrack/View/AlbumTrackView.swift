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
            
            if viewModel.isLoading{
                progressView
            } else {
                VStack(spacing: 8) {
                    albumName
                    quantityOfTracks
                    
                    if viewModel.tracks.isEmpty {
                        Spacer()
                        
                        emptyTrackList
                        
                        Spacer()
                    } else {
                        trackList
                    }
                }
            }
        }
    }
}

// MARK: - Components
private extension AlbumTrackView {
    var albumName: some View {
        Text(album.name)
            .styleTitleSheet()
    }
    
    var quantityOfTracks: some View {
        let total = album.totalTracks ?? 0
        return Text("\(total) \(total == 1 ? "faixa" : "faixas") no álbum")
            .foregroundStyle(.grayLight)
            .font(.system(size: 16).weight(.semibold))
            .fontDesign(.rounded)
    }
}

// MARK: - States
private extension AlbumTrackView {
    var trackList: some View { 
        ScrollView(showsIndicators: false) {
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
                .foregroundColor(.grayLight)
                .font(.system(size: 18).weight(.semibold))
        }
    }
    
    var progressView: some View {
        ProgressView()
            .styleProgressView()
    }
}

#Preview {
    let album = PreviewData.sampleAlbums[1]
    return AlbumTrackView(album: album)
}
