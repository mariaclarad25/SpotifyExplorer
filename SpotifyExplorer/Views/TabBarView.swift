//
//  TabBarView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct TabBarView: View {
        init() {
            configureTabBarAppearance()
        }
    
    var body: some View {
            TabView {
                SearchArtistView()
                    .tabItem {
                        Image(systemName: "music.mic")
                        Text("Artistas")
                    }
                
                FavoriteArtists()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }
            }
            .tint(Color(.lightPurple))
            .navigationBarBackButtonHidden(true)
        }
    }

#Preview {
    TabBarView()
}
