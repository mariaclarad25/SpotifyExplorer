//
//  CardArtistView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 30/07/25.
//

import SwiftUI

struct CardArtistView: View {
    let artist = MockData.sampleArtist
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: artist[0].image))
                .frame(width: 125, height: 120)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(artist[0].name)
                    .font(.title3)
                    .foregroundStyle(.white)
                
                Text("Seguidores: \(artist[0].followers)")
                    .foregroundStyle(.grayLight)
                    .padding(.bottom, 15)
                    .font(.footnote)
                
                HStack{
                    Image(systemName: "heart")
                        .foregroundStyle(.lightPurple)
                    Text("Favoritar")
                        .foregroundStyle(.grayLight)
                        .font(.subheadline)
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
    CardArtistView()
}
