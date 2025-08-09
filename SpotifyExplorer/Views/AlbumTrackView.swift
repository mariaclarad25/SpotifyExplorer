//
//  AlbumTrackView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import SwiftUI

struct AlbumTrackView: View {
    let album: Album
    let tracks: [Track]
    
    var body: some View {
        ZStack{
            Color(.darkPurple).ignoresSafeArea()
            
            VStack(spacing: 16) {
                albumName
                
                if tracks.isEmpty {
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
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.greenCustom)
            .frame(alignment: .center)
            .padding(.top, 10)
            .padding(.bottom, 20)
    }
}

// MARK: - Content States
private extension AlbumTrackView {
    var trackList: some View {
        ScrollView{
            VStack(spacing: 6) {
                ForEach(tracks) { track in
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
            
            Text("Nenhuma faixa disponível")
                .foregroundColor(.white)
                .font(.system(size: 18).weight(.semibold))
        }
    }
}

#Preview {
    AlbumTrackView(
        album: MockData.sampleAlbums[0],
        tracks: MockData.sampleTracks.filter { $0.albumId == MockData.sampleAlbums[0].id }
    )
}
