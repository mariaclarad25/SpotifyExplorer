//
//  FavoriteButton.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 06/08/25.
//

import SwiftUI

struct FavoriteButton: View {
    let artist: Artist
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var color: Color = .darkPurple
    var colorText: Color = .darkPurple
    var text: String = ""
    var textFill: String = ""
    var iconSize: CGFloat = 18
    
    var body: some View {
        Button(action: {
            favoritesViewModel.toggleFavorite(for: artist)
        }) {
            Image(systemName: favoritesViewModel.isFavorite(artist) ? "heart.fill" : "heart")
                .font(.system(size: iconSize))
                .foregroundStyle(color)
            
            let text = favoritesViewModel.isFavorite(artist) ? textFill : text
            if !text.isEmpty {
                Text(text)
                    .foregroundStyle(colorText)
                    .font(.subheadline)
            }
        }
    }
}


#Preview {
    FavoriteButton(artist: MockData.sampleArtist[0], favoritesViewModel: FavoritesViewModel())
}
