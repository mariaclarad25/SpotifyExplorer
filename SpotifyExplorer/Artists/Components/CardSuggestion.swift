//
//  CardSuggestion.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/07/25.
//

import SwiftUI
import Kingfisher

struct CardSuggestion: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    let artist: Artist
    
    var body: some View {
        VStack{
            artistImage
            
            HStack{
                VStack{
                    artistName
                    artistPopularity
                }
                
                FavoriteButton(artist: artist,
                               favoritesViewModel: favoritesViewModel,
                               color: .darkPurple,
                               iconSize: 20)
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
        .padding(.vertical)
    }
}

// MARK: - Components
@MainActor
private extension CardSuggestion {
    var artistImage: some View {
        KFImage(URL(string: artist.images?.first?.url ?? ""))
            .placeholder {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
            }
            .cancelOnDisappear(true)
            .downsampling(size: CGSize(width: 180, height: 180))
            .scaleFactor(UIScreen.main.scale)
            .fade(duration: 0.25)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 180, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.top, 10)
    }
    
    var artistName: some View {
        Text(artist.name)
            .font(.system(size: 16).bold())
            .foregroundStyle(.darkPurple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
            .truncationMode(.tail)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
    }
    
    var artistPopularity: some View {
        Text("Popularidade: \(artist.popularity ?? 0)")
            .font(.system(size: 12).bold())
            .foregroundStyle(.darkPurple.opacity(0.6))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    CardSuggestion(artist: PreviewData.sampleArtists[0])
        .environmentObject(FavoritesViewModel())
}
