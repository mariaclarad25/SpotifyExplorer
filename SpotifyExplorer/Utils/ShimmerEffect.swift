//
//  ShimmerEffect.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/09/25.
//

import SwiftUI

struct ShimmerEffect: View {
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.clear, .lightPurple.opacity(0.2), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .rotationEffect(.degrees(45))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        ShimmerEffect()
    }
}
