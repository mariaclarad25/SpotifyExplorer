//
//  CardFavorites.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/07/25.
//

import SwiftUI

struct CardFavorites: View {
    let artist = MockData.sampleArtist
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: artist[0].image))
                .frame(width: 125, height: 135)
                .cornerRadius(8)
            
            Text("\(artist[0].name)")
                .foregroundStyle(.grayLight)
            
            Image(systemName: "heart")
                .foregroundStyle(.lightPurple)
                .padding(.top, -6)
        }
        .padding()
        .background(.purpleHighlight)
        .frame(width: 140, height: 205)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.lightPurple, lineWidth: 2)
        )
        .shadow(color: Color.lightPurple.opacity(0.8), radius: 2, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    CardFavorites()
}
