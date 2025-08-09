//
//  CardFavorites.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/07/25.
//

import SwiftUI

struct CardFavorites: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    let artist: Artist
    
    var body: some View {
        VStack{
            artistImage
            artistName
            
            FavoriteButton(artist: artist, favoritesViewModel: favoritesViewModel, color: .lightPurple)
                .padding(.bottom, 10)
            
        }
        .padding()
        .background(.purpleHighlight)
        .frame(width: 140, height: 210)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.lightPurple, lineWidth: 2)
        )
        .shadow(color: Color.lightPurple.opacity(0.8), radius: 2, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Components
private extension CardFavorites {
    var artistImage: some View {
        AsyncImage(url: URL(string: artist.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                        .font(.title)
                )
        }
        .frame(width: 125, height: 135)
        .cornerRadius(8)
    }
    
    var artistName: some View {
        Text("\(artist.name)")
            .foregroundStyle(.grayLight)
            .padding(.bottom, 4)
    }
}

#Preview {
    CardFavorites(artist: MockData.sampleArtist[0])
        .environmentObject(FavoritesViewModel())
}
