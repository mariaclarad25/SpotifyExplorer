//
//  ShimmerEffect.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/09/25.
//

import SwiftUI

struct ShimmerEffect: View {
    @State private var shimmerOffset: CGFloat = 0
    
    private let shimmerDuration: Double = 4
    private let shimmerColor: Color = .green.opacity(0.2)
    
    var body: some View {
        GeometryReader { geo in
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.clear, shimmerColor, .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .rotationEffect(.degrees(45))
                .offset(x: shimmerOffset)
                .onAppear {
                    shimmerOffset = -geo.size.width
                    withAnimation(.linear(duration: shimmerDuration).repeatForever(autoreverses: false)) {
                        shimmerOffset = geo.size.width * 2
                    }
                }
        }
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        ShimmerEffect()
    }
}
