//
//  DetailsScreenHeader.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 06/08/25.
//

import SwiftUI
import Kingfisher

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
@MainActor
private extension DetailsScreenHeader {
    var artistHeaderImage: some View {
        GeometryReader { geo in
            KFImage(URL(string: artist.images?.first?.url ?? ""))
                .placeholder {
                    emptyImagePlaceholder
                }
                .cancelOnDisappear(true)
                .cacheOriginalImage()
                .onFailure { _ in }
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: 470)
                .clipped()
        }
        .frame(height: 470)
        .ignoresSafeArea(edges: .top)
    }
    
    var artistNameText: some View {
        Text(artist.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(radius: 2)
            .minimumScaleFactor(0.7)
            .lineLimit(1)
    }
    
    @ViewBuilder
    var artistGenreText: some View {
        if let genres = artist.genres, !genres.isEmpty {
            Text(genres.joined(separator: " • "))
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.85))
                .minimumScaleFactor(0.7)
                .lineLimit(2)
        }
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
                           iconSize: 28)
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
    var emptyImagePlaceholder: some View {
        ZStack {
            Color(.darkPurple)
            
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .foregroundColor(.grayLight.opacity(0.8))
        }
    }
}

#Preview {
    DetailsScreenHeader(artist: PreviewData.sampleArtists[1])
        .environmentObject(FavoritesViewModel())
}
