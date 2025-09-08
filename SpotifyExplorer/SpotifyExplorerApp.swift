//
//  SpotifyExplorerApp.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 28/07/25.
//

import SwiftUI
import Kingfisher

@main
struct SpotifyExplorerApp: App {
    @StateObject var favoritesViewModel = FavoritesViewModel()
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        configureImageCache()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(favoritesViewModel)
        }
        .onChange(of: scenePhase) { _ , newPhase in
            if newPhase == .background {
                ImageCache.default.cleanExpiredDiskCache()
            }
        }
    }
}
