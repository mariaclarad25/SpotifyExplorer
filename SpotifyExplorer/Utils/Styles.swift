//
//  Styles.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/08/25.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color(.darkPurple),
                Color(.mediumDarkPurple),
                Color(.softDarkPurple)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
 
extension View {
    func styleSubtitlesArtistView() -> some View {
        self
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.greenLigth)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    func styleTitleSheet() -> some View {
        self
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.greenCustom)
            .frame(alignment: .center)
            .padding(.top, 10)
            .padding(.bottom, 20)
    }
}
