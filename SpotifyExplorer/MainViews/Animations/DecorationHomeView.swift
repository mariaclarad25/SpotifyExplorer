//
//  DecorationHomeView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/09/25.
//

import SwiftUI

struct DecorationHomeView: View {
    var body: some View {
        ZStack{
            GradientBackground()
            MusicBar()
            ParticlesView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DecorationHomeView()
}
