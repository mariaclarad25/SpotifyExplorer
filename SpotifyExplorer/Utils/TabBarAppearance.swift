//
//  TabBarAppearance.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 25/08/25.
//

import UIKit

func configureTabBarAppearance() {
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "GrayishPurple")
    
    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance
    UITabBar.appearance().unselectedItemTintColor = UIColor(named: "grayMedium")
}
