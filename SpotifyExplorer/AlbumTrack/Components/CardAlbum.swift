//
//  CardAlbum.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/08/25.
//

import SwiftUI
import Kingfisher

struct CardAlbum: View {
    let album: Album
    
    var body: some View {
        VStack {
            albumImage
            albumName
            releaseDate
            Spacer()
        }
        .background(.clear)
        .frame(width: 170, height: 250)
        .cornerRadius(4)
    }
}

@MainActor
private extension CardAlbum {
    var albumImage: some View {
        KFImage(URL(string: album.images?.first?.url ?? ""))
            .placeholder {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "music.note.list")
                            .foregroundColor(.gray)
                            .font(.title)
                    )
            }
            .cancelOnDisappear(true)
            .downsampling(size: CGSize(width: 170, height: 170))
            .scaleFactor(UIScreen.main.scale)
            .fade(duration: 0.25)
            .resizable()
            .scaledToFill()
            .frame(width: 170, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
    
    var albumName: some View {
        Text(album.name)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 16).weight(.semibold))
            .lineLimit(1)
            .padding(.bottom, 1)
    }
    
    var releaseDate: some View {
        Text("Lançado em: \(formatDate(album.releaseDate ?? ""))")
            .foregroundStyle(.grayLight)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14).weight(.regular))
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        CardAlbum(album: PreviewData.sampleAlbums[0])
    }
}
