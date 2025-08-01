//
//  CardSuggestion.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/07/25.
//

import SwiftUI

struct CardSuggestion: View {
    let artist: Artist
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: artist.imageLarge))
                .frame(width: 180, height: 180)
                .cornerRadius(8)
                .clipped()
                .padding(.top, 10)
            
            HStack{
                VStack{
                    Text("\(artist.name)")
                        .font(.system(size: 16).bold())
                        .foregroundStyle(.darkPurple)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Text("Popularidade: \(artist.popularity)")
                        .font(.system(size: 12).bold())
                        .foregroundStyle(.darkPurple.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
                
                Image(systemName: "heart")
                    .foregroundStyle(.darkPurple)
                    .padding()
            }
            Spacer()
        }
        .frame(width: 200, height: 260)
        .background(LinearGradient(
            colors: [Color.purpleHighlight, Color.greenLigth],
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .cornerRadius(8)
        .padding()
    }
}


#Preview {
    CardSuggestion(artist: MockData.sampleArtist[0])
}
