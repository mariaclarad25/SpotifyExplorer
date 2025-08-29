//
//  CardTracks.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import SwiftUI

struct CardTracks: View {
    let track: Track
    
    var body: some View {
        HStack {
            iconNote
            musicName
            
            Spacer()
            
            linkSpotifyButton
            musicDuration
        }
        .padding()
        .background(Color(.black).opacity(0.2))
        .cornerRadius(4)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Components
private extension CardTracks {
    var iconNote: some View {
        Image(systemName: "music.note")
            .font(.title3)
            .foregroundColor(.white)
    }
    
    var musicName: some View {
        Text(track.name)
            .foregroundColor(.white)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    var linkSpotifyButton: some View {
        Button(action: {
            let spotifyURL = "https://open.spotify.com/track/\(track.id)"
            
            if let url = URL(string: spotifyURL) {
                UIApplication.shared.open(url)
            } else {
                print("Failed to create Spotify URL")
            }
        }) {
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.system(size: 22))
        }
    }
    
    var musicDuration: some View {
        Text(formatDuration(track.durationMs ?? 0))
            .foregroundColor(.grayLight)
    }
}

#Preview {
    ZStack {
        Color(.purpleHighlight).ignoresSafeArea()
        CardTracks(track: PreviewData.sampleTracks[0])
    }
}
