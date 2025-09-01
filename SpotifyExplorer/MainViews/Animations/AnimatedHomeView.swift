//
//  AnimatedHomeView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 31/08/25.
//

import SwiftUI

struct AnimatedHomeView: View {
    var body: some View {
        ZStack {
            GradientBackground()
            
            ParticlesView()
            
            ShimmerEffect()
            
            MusicBarView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AnimatedHomeView()
}
