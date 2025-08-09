//
//  Styles.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/08/25.
//

import SwiftUI
import UIKit

func configureTabBarAppearance() {
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "grayishPurple")
    
    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance
    UITabBar.appearance().unselectedItemTintColor = UIColor(named: "grayMedium")
}
 
extension View {
    func styleSubtitlesArtistView() -> some View {
        self
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.greenLigth)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

func formatFollowers(_ followers: Int) -> String {
    if followers >= 1_000_000 {
        return String(format: "%.1fM", Double(followers) / 1_000_000)
    } else if followers >= 1_000 {
        return String(format: "%.1fK", Double(followers) / 1_000)
    } else {
        return "\(followers)"
    }
}
