//
//  DetailsScreenHeader.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 06/08/25.
//

import SwiftUI

struct DetailsScreenHeader: View {
    let artist: Artist
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            artistHeaderImage
                .frame(height: 470)
                .frame(maxWidth: .infinity)
                .clipped()
                .ignoresSafeArea(edges: .top)
                .overlay(gradientOverlay)
            
            artistInfoSection
        }
    }
}

// MARK: - Components
private extension DetailsScreenHeader {
    var artistHeaderImage: some View {
        AsyncImage(url: URL(string: artist.imageBig)) { phase in
            switch phase {
            case .empty:
                loadingPlaceholder
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                errorPlaceholder
            @unknown default:
                Color(.darkPurple)
            }
        }
    }
    
    var artistNameText: some View {
        Text(artist.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(radius: 2)
    }
    
    var artistGenreText: some View {
        Text(artist.genres.joined(separator: " • "))
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.85))
    }
    
    var artistInfoSection: some View {
        HStack{
            VStack(alignment: .leading, spacing: 6) {
                artistNameText
                artistGenreText
            }
            Spacer()
            FavoriteButton(artist: artist,
                           favoritesViewModel: favoritesViewModel,
                           color: .white,
                           iconSize: 22)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
    }
    
    var gradientOverlay: some View {
        LinearGradient(
            colors: [Color.black.opacity(0.55), Color.clear],
            startPoint: .bottom,
            endPoint: .center
        )
    }
}

// MARK: - States
private extension DetailsScreenHeader {
    var loadingPlaceholder: some View {
        ZStack {
            Color(.darkPurple)
            ProgressView()
        }
    }
    
    var errorPlaceholder: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
        .foregroundColor(.gray)    }
}

#Preview {
    DetailsScreenHeader(artist: MockData.sampleArtist[0])
        .environmentObject(FavoritesViewModel())
}
