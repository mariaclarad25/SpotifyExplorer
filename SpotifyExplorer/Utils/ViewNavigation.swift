//
//  ViewNavigation.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 25/08/25.
//

import SwiftUI

extension View {
    func navigationConfiguration() -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
    }
}

private struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .padding(8)
                .background(Color.darkPurple.opacity(0.4))
                .clipShape(Circle())
                .shadow(color: .darkPurple.opacity(0.8), radius: 2, x: 0, y: 1)
                .font(.system(size: 16, weight: .medium))
        }
    }
}
