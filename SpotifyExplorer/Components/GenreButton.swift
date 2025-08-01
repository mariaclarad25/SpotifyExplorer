//
//  GenreButton.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 30/07/25.
//

import SwiftUI

struct GenreButton: View {
    let genre: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(genre.capitalized)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 110, height: 110)                .background(Circle().fill(
                    LinearGradient(
                        colors: [Color.purpleHighlight, Color.greenLigth],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            )
                .shadow(color: Color.lightPurple.opacity(0.6), radius: 8, x: 0, y: 4)
        }
    }
}

#Preview {
    GenreButton(genre: "Sertanejo") {
        print ("Botão clicado")
    }
}
