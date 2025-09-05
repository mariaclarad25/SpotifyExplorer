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
        NavigationStack{
            ZStack{
                Color(.darkPurple).ignoresSafeArea()
                ShimmerEffect()
                
                VStack{
                    titleHeader
                    
                    Spacer()
                    
                    if favoritesViewModel.favoriteArtists.isEmpty {
                        favoritesEmpty
                    }
                    else {
                        countFavorites
                        favoriteArtistsGrid
                    }
                    Spacer()
                }
                .padding(.top, 80)
                .edgesIgnoringSafeArea(.top)
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
        
    }
    
    var favoriteArtistsGrid: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)],
                      spacing: 20
            ) {
                ForEach(favoritesViewModel.favoriteArtists) { artist in
                    NavigationLink(destination: ArtistDetailsView(viewModel: ArtistDetailsViewModel(artist: artist))) {
                        CardFavorites(artist: artist)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
    }
    
    var countFavorites: some View {
        Text("\(favoritesViewModel.favoriteArtists.count) \(favoritesViewModel.favoriteArtists.count == 1 ? "artista favoritado" : "artistas favoritados")")
            .foregroundStyle(Color(.grayLight))
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 15)
    }
}

// MARK: - States
private extension FavoriteArtists {
    var favoritesEmpty: some View {
        VStack(spacing: 20) {
            ZStack{
                Circle()
                    .fill(.lightPurple.opacity(0.2))
                    .blur(radius: 12)
                    .frame(width: 200, height: 200)
                
                    Text("🤍")
                        .font(.system(size: 65))
            }
            
            Text("Nenhum favoritado.")
                .foregroundStyle(Color(.grayMedium))
                .font(.system(size: 20, weight: .semibold))
            
            Text("Explore artistas e adicione nos seus favoritos tocando no 🤍")
                .foregroundStyle(Color(.grayLight))
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .frame(width: 380)
        }
    }
}

#Preview {
    FavoriteArtists()
        .environmentObject(FavoritesViewModel())
}
