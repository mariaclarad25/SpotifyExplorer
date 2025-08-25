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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.lightPurple)
                .font(.system(size: 18, weight: .medium))
        }
    }
}
