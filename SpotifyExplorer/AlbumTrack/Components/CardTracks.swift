//
//  CardTracks.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 07/08/25.
//

import SwiftUI
import Kingfisher

struct CardTracks: View {
    let track: Track
    @State private var isButtonPressed = false
    
    var body: some View {
        HStack(spacing: 10) {
            musicImage
            musicName
            
            Spacer()
            
            musicPopularity
            linkSpotifyButton
            musicDuration
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            LinearGradient(colors: [Color.purple.opacity(0.1), Color.lightPurple.opacity(0.1)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(4)
        .frame(width: 375, height: 58)
    }
}

// MARK: - Components
private extension CardTracks {
    @MainActor
    var musicImage: some View {
        KFImage(URL(string: track.imageURL ?? ""))
            .placeholder {
                Image(systemName: "music.note")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
            }
            .cancelOnDisappear(true)
            .downsampling(size: CGSize(width: 40, height: 40))
            .scaleFactor(UIScreen.main.scale)
            .fade(duration: 0.25)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipped()
    }
    
    var musicName: some View {
        Text(track.name)
            .font(.system(size: 18))
            .fontDesign(.rounded)
            .foregroundColor(.white)
            .lineLimit(1)
            .truncationMode(.tail)
            .padding(.leading, 10)
    }
    
    var musicPopularity: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .font(.caption)
                .foregroundColor(.lightPurple)
            
            Text("\(track.popularity ?? 0)")
                .font(.caption)
                .foregroundColor(.grayLight)
        }
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
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 32, height: 32)
                
                Image(systemName: "play.fill")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
    
    var musicDuration: some View {
        Text(formatDuration(track.durationMs ?? 0))
            .font(.system(size: 18))
            .fontDesign(.rounded)
            .foregroundColor(.grayLight)
    }
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        
        VStack(spacing: 8) {
            CardTracks(track: PreviewData.sampleTracks[0])
            CardTracks(track: PreviewData.sampleTracks[1])
            CardTracks(track: PreviewData.sampleTracks[2])
        }
        .padding(.horizontal)
    }
}
