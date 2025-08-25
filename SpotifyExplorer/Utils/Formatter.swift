//
//  Formatter.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 25/08/25.
//

import Foundation

func formatFollowers(_ followers: Int) -> String {
    if followers >= 1_000_000 {
        return String(format: "%.1fM", Double(followers) / 1_000_000)
    } else if followers >= 1_000 {
        return String(format: "%.1fK", Double(followers) / 1_000)
    } else {
        return "\(followers)"
    }
}

func formatDuration(_ durationMs: Int) -> String {
    let minutes = durationMs / 60000
    let seconds = (durationMs % 60000) / 1000
    return String(format: "%d:%02d", minutes, seconds)
}
