//
//  FavoriteArtists.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct FavoriteArtists: View {
    var body: some View {
        ZStack{
            Color(.darkPurple).ignoresSafeArea()

            VStack{
                Text("Meus Favoritos")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.grayLight)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding()
                 
                ScrollView{
                    HStack(spacing: 50) {
                        CardFavorites()
                        CardFavorites()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    FavoriteArtists()
}
