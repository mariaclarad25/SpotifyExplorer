//
//  FavoriteArtists.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct FavoriteArtists: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        ZStack{
            Color(.darkPurple).ignoresSafeArea()
            
            VStack{
                Text("Meus Favoritos")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.grayLight)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                if favoritesViewModel.favoriteArtists.isEmpty {
                    Text("Nenhum artista favoritado ainda.")
                        .foregroundStyle(Color(.grayMedium))
                        .padding()
                } else {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(favoritesViewModel.favoriteArtists) { artist in
                                    CardFavorites(artist: artist)
                                }
                            }
                            .padding(.bottom, 30)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FavoriteArtists()
        .environmentObject(FavoritesViewModel())
}
