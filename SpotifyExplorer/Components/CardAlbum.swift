//
//  CardAlbum.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/08/25.
//

import SwiftUI

struct CardAlbum: View {
    let album: Album
    
    var body: some View {
        VStack{
            albumImage
            albumName
            quantityTracks
        }
        .background(.clear)
        .frame(width: 170)
        .cornerRadius(4)
    }
}

private extension CardAlbum {
    var albumImage: some View {
        AsyncImage(url: URL(string: album.image)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                    .cornerRadius(4)
            } else if phase.error != nil {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "music.note.list")
                            .foregroundColor(.gray)
                            .font(.title)
                    )
                    .frame(width: 170, height: 170)
                    .cornerRadius(4)
            }
        }
    }
    
    var albumName: some View {
        Text(album.name)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 16).weight(.semibold))
            .padding(.bottom, 1)
    }
    
    var quantityTracks: some View {
        Text("\(album.totalTracks) músicas")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14))
            .padding(.bottom)
    }
}


#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        CardAlbum(album: MockData.sampleAlbums[0])
    }
}
