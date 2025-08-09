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
                titleHeader
                
                if favoritesViewModel.favoriteArtists.isEmpty {
                    favoritesEmpty
                } else {
                    favoriteArtistsGrid
                }
                Spacer()
            }
        }
    }
}

// MARK: - Components
private extension FavoriteArtists {
    var titleHeader: some View {
        Text("Meus Favoritos")
            .font(.system(size: 30, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.grayLight)
            .padding(.horizontal)
            .padding(.top, 20)
        
    }
    
    var favoriteArtistsGrid: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)],
                      spacing: 20
            ) {
                ForEach(favoritesViewModel.favoriteArtists) { artist in
                    CardFavorites(artist: artist)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
    }
}

// MARK: - Empty States
private extension FavoriteArtists {
    var favoritesEmpty: some View {
        Text("Nenhum artista favoritado ainda.")
            .foregroundStyle(Color(.grayMedium))
            .padding()
    }
}

#Preview {
    FavoriteArtists()
        .environmentObject(FavoritesViewModel())
}
