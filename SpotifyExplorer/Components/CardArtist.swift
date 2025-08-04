//
//  CardArtistView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 30/07/25.
//

import SwiftUI

struct CardArtistView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    let artist: Artist
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: artist.image))
                .frame(width: 125, height: 120)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(artist.name)
                    .font(.title3)
                    .foregroundStyle(.white)
                
                Text("Gênero:")
                    .foregroundStyle(.grayLight)
                    .font(.footnote)
                
                Text("Seguidores: \(artist.followers)")
                    .foregroundStyle(.grayLight)
                    .padding(.bottom, 15)
                    .font(.footnote)
                
                HStack{
                    Button(action: {
                        favoritesViewModel.toggleFavorite(for: artist)
                    }) {
                        Image(systemName: favoritesViewModel.isFavorite(artist) ? "heart.fill" : "heart")
                            .foregroundStyle(.lightPurple)
                        Text(favoritesViewModel.isFavorite(artist) ? "Remover dos favoritos" : "Favoritar")
                            .foregroundStyle(.grayLight)
                            .font(.subheadline)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 360, height: 150)
        .background(Color(.darkPurple))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.purpleHighlight, lineWidth: 6)
        )
        .shadow(color: Color.lightPurple.opacity(0.8), radius: 6, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    CardArtistView(artist: MockData.sampleArtist[0])
        .environmentObject(FavoritesViewModel())
}
