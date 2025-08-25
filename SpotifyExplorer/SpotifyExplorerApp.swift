//
//  SpotifyExplorerApp.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 28/07/25.
//

import SwiftUI

@main
struct SpotifyExplorerApp: App {
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(favoritesViewModel)
        }
    }
}
