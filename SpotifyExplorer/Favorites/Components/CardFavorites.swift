//
//  CardFavorites.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/07/25.
//

import SwiftUI
import Kingfisher

struct CardFavorites: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    let artist: Artist
    
    var body: some View {
        VStack{
            artistImage
            artistName
            
            FavoriteButton(artist: artist,
                           favoritesViewModel: favoritesViewModel,
                           color: .lightPurple,
                           iconSize: 20)
            .padding(.bottom, 10)
            
        }
        .padding()
        .background(Color.purpleHighlight.opacity(0.4))
        .frame(width: 162, height: 225)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.lightPurple, lineWidth: 2)
        )
        .shadow(color: Color.lightPurple.opacity(0.3), radius: 2, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Components
@MainActor
private extension CardFavorites {
    var artistImage: some View {
        KFImage(URL(string: artist.images?.first?.url ?? ""))
            .placeholder {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.grayLight)
                            .font(.title)
                    )
            }
            .cancelOnDisappear(true)
            .downsampling(size: CGSize(width: 145, height: 145))
            .scaleFactor(UIScreen.main.scale)
            .fade(duration: 0.25)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 145, height: 145)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    var artistName: some View {
        Text("\(artist.name)")
            .foregroundStyle(.grayLight)
            .font(.system(size: 18, weight: .medium))
            .padding(.bottom, 4)
    }
}

#Preview {
    ZStack{
        Color.darkPurple
            .ignoresSafeArea()
        
        CardFavorites(artist: PreviewData.sampleArtists[2])
            .environmentObject(FavoritesViewModel())
    }
}
