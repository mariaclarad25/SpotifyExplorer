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
            artistImage
            
            VStack(alignment: .leading, spacing: 8) {
                artistName
                artistGenres
                artistStats
                
                FavoriteButton(artist: artist,
                               favoritesViewModel: favoritesViewModel,
                               color: Color(.lightPurple),
                               colorText: .white ,text: "Favoritar",
                               textFill: "Remover")
                    .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 360, height: 150)
        .background(Color(.black).opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.purpleHighlight, lineWidth: 6)
        )
        .shadow(color: Color.lightPurple.opacity(0.4), radius: 6, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Components
private extension CardArtistView {
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
        .frame(width: 125, height: 120)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
    
    var artistName: some View {
        Text(artist.name)
            .font(.title3)
            .foregroundStyle(.white)
    }
    
    var artistGenres: some View {
        Text(artist.genres.joined(separator: " • "))
            .foregroundStyle(.grayLight)
            .font(.footnote)
    }
    
    var artistStats: some View {
        HStack(spacing: 16) {
            artistStatsPopularity
            artistStatsFollowers
        }
        .padding(.bottom, 10)
    }
    
    var artistStatsPopularity: some View {
        HStack(spacing: 4) {
            Image(systemName: "person.2.fill")
                .font(.caption)
                .foregroundColor(.greenCustom)
            
            Text(formatFollowers(artist.followers))
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    var artistStatsFollowers: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.caption)
                .foregroundColor(.yellow)
            
            Text("\(artist.popularity)")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        CardArtistView(artist: MockData.sampleArtist[0])
            .environmentObject(FavoritesViewModel())
    }
}
