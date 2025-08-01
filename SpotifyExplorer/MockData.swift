//
//  MockData.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 30/07/25.
//

import Foundation

// MARK: - Artist Model
struct Artist: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let image: String
    let imageLarge: String
    let genres: [String]
    let followers: Int
    let popularity: Int
}

// MARK: - Track Model
struct Track: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let previewUrl: String?
    let albumName: String
    let image: String
    let spotifyUrl: String
}

// MARK: - Album Model
struct Album: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let image: String
    let releaseDate: String
    let totalTracks: Int
}

// MARK: - MockData
struct MockData {
    
    // Artistas
    static let sampleArtist = [
        Artist(
            id: "7y97mc3bZRFXzT2szRM4L4",
            name: "Luan Santana",
            image: "https://i.scdn.co/image/ab6761610000f178fde13b4ff04ee1c0f33c6878",
            imageLarge: "https://i.scdn.co/image/ab67616100005174fde13b4ff04ee1c0f33c6878",
            genres: ["sertanejo", "pop brasileiro"],
            followers: 7000000,
            popularity: 80
        ),
        Artist(
            id: "2",
            name: "Veigh",
            image: "https://i.scdn.co/image/ab6761610000f1781e2e0eaf91cf96ee9a8d28f0",
            imageLarge: "https://i.scdn.co/image/ab676161000051741c548715daf25de6353b56f4",
            genres: ["trap brasileiro", "trap", "hip hop brasileiro", "trap funk"],
            followers: 9000000,
            popularity: 82
        ),
        Artist(
            id: "3",
            name: "Artista Novo",
            image: "https://i.scdn.co/image/ab6761610000f178aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            imageLarge: "https://i.scdn.co/image/ab67616100005174aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            genres: ["indie"],
            followers: 10000,
            popularity: 35
        )
    ]
    
    // Músicas populares - Luan Santana
    static let sampleTracks = [
        Track(
            id: "1",
            name: "Morena",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-morena.mp3",
            albumName: "Luan City",
            image: "https://i.scdn.co/image/ab67616d00001e02e4f6b6a3b4d8e63e6aaef243",
            spotifyUrl: "https://open.spotify.com/track/1morena"
        ),
        Track(
            id: "2",
            name: "Abalo Emocional",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-abalo-emocional.mp3",
            albumName: "Luan City 2.0",
            image: "https://i.scdn.co/image/ab67616d00001e0285cf7cbe1f8674bfc1b5d6d7",
            spotifyUrl: "https://open.spotify.com/track/2abalo-emocional"
        ),
        Track(
            id: "3",
            name: "Sorria",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-sorria.mp3",
            albumName: "Sorria",
            image: "https://i.scdn.co/image/ab67616d00001e02b2c0a75a1b6c6d4ab4146e2f",
            spotifyUrl: "https://open.spotify.com/track/3sorria"
        ),
        Track(
            id: "4",
            name: "Escreve Aí",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-escreve-ai.mp3",
            albumName: "Acústico",
            image: "https://i.scdn.co/image/ab67616d00001e0272f2ab0fa0d02ac50dd03329",
            spotifyUrl: "https://open.spotify.com/track/4escreve-ai"
        ),
        Track(
            id: "5",
            name: "Te Esperando",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-te-esperando.mp3",
            albumName: "O Nosso Tempo é Hoje",
            image: "https://i.scdn.co/image/ab67616d00001e02ff3829b23111d3d27ee0d08e",
            spotifyUrl: "https://open.spotify.com/track/5te-esperando"
        ),

        // Músicas populares - Veigh
        Track(
            id: "6",
            name: "Novo Balanço",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-novo-balanco.mp3",
            albumName: "Dos Prédios Deluxe",
            image: "https://i.scdn.co/image/ab67616d00001e02d8bb5db5ba823ca43fc63ed6",
            spotifyUrl: "https://open.spotify.com/track/6novo-balanco"
        ),
        Track(
            id: "7",
            name: "Engana Dizendo Que Ama",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-engana.mp3",
            albumName: "Dos Prédios",
            image: "https://i.scdn.co/image/ab67616d00001e02888a6b12540e0cb31b295a77",
            spotifyUrl: "https://open.spotify.com/track/7engana"
        ),
        Track(
            id: "8",
            name: "Pra Sempre",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-pra-sempre.mp3",
            albumName: "Dos Prédios",
            image: "https://i.scdn.co/image/ab67616d00001e02fa19c86e72abf03b4e2bcbb6",
            spotifyUrl: "https://open.spotify.com/track/8pra-sempre"
        ),

        // Músicas populares - Artista Novo
        Track(
            id: "9",
            name: "Luzes da Cidade",
            previewUrl: nil,
            albumName: "Horizonte Azul",
            image: "https://i.scdn.co/image/ab67616d00001e02aaaaaaaabbbbbbbbcccccccc",
            spotifyUrl: "https://open.spotify.com/track/9luzes"
        ),
        Track(
            id: "10",
            name: "Tempestade Solar",
            previewUrl: nil,
            albumName: "Tempestade",
            image: "https://i.scdn.co/image/ab67616d00001e02dddddddddddddddddddddddd",
            spotifyUrl: "https://open.spotify.com/track/10tempestade"
        )
    ]
    
    // Álbuns - Luan Santana
    static let sampleAlbums = [
        Album(
            id: "1",
            name: "Luan City 2.0",
            image: "https://i.scdn.co/image/ab67616d0000b2736ac7cb4f62dc68194f72e59a",
            releaseDate: "2023-03-17",
            totalTracks: 20
        ),
        Album(
            id: "2",
            name: "Luan City",
            image: "https://i.scdn.co/image/ab67616d0000b273b4a4a1ff2c213816ae0584c6",
            releaseDate: "2022-05-13",
            totalTracks: 19
        ),
        Album(
            id: "3",
            name: "Acústico",
            image: "https://i.scdn.co/image/ab67616d0000b2732d0f6c3a1a98d1e9f122a2c2",
            releaseDate: "2015-10-09",
            totalTracks: 15
        ),

        // Álbuns - Veigh
        Album(
            id: "4",
            name: "Dos Prédios Deluxe",
            image: "https://i.scdn.co/image/ab67616d0000b273a8e8dd195d644af3ee3a5b2d",
            releaseDate: "2023-06-01",
            totalTracks: 15
        ),
        Album(
            id: "5",
            name: "Dos Prédios",
            image: "https://i.scdn.co/image/ab67616d0000b2732dfb4e15a72a9791a4dbb6eb",
            releaseDate: "2022-10-10",
            totalTracks: 12
        ),

        // Álbuns - Artista Novo
        Album(
            id: "6",
            name: "Horizonte Azul",
            image: "https://i.scdn.co/image/ab67616d0000b273bbbbbbbbbbbbbbbbbbbbbbbb",
            releaseDate: "2024-01-15",
            totalTracks: 8
        ),
        Album(
            id: "7",
            name: "Tempestade",
            image: "https://i.scdn.co/image/ab67616d0000b273cccccccccccccccccccccccc",
            releaseDate: "2023-06-20",
            totalTracks: 10
        )
    ]
}
