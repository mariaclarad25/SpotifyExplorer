//
//  MusicBar.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/09/25.
//

import SwiftUI

struct MusicBarView: View {
    @State private var barHeights: [CGFloat] = []
    
    private let barSpacing: CGFloat = 6
    private let barCornerRadius: CGFloat = 4
    private let barMinHeight: CGFloat = 10
    private let barMaxHeight: CGFloat = 60
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                HStack(alignment: .bottom, spacing: barSpacing) {
                    ForEach(barHeights.indices, id: \.self) { index in
                        RoundedRectangle(cornerRadius: barCornerRadius)
                            .fill(Color.greenCustom)
                            .frame(width: barWidth(in: geo.size.width), height: barHeights[index])
                            .animation(
                                .easeInOut(duration: Double.random(in: 0.8...1.8))
                                    .repeatForever(autoreverses: true),
                                value: barHeights[index]
                            )
                    }
                }
                .padding(.horizontal, 4)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                setupBars(screenWidth: geo.size.width)
                animateBars()
            }
        }
    }
    
    private func barWidth(in totalWidth: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat(barHeights.count - 1) * barSpacing
        return (totalWidth - 8 - totalSpacing) / CGFloat(barHeights.count)
    }
    
    private func setupBars(screenWidth: CGFloat) {
        let barCount = Int((screenWidth - 8) / (6 + barSpacing))
        barHeights = (0..<barCount).map { _ in CGFloat.random(in: barMinHeight...barMaxHeight) }
    }
    
    private func animateBars() {
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
            for i in barHeights.indices {
                barHeights[i] = CGFloat.random(in: barMinHeight...barMaxHeight)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        MusicBarView()
    }
}
