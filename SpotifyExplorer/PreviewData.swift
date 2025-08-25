//
//  PreviewData.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/08/25.
//

import Foundation

struct PreviewData {
    
    static let sampleArtist = [
        Artist(
            id: "7y97mc3bZRFXzT2szRM4L4",
            name: "Luan Santana",
            image: "https://i.scdn.co/image/ab6761610000f178fde13b4ff04ee1c0f33c6878",
            imageLarge: "https://i.scdn.co/image/ab67616100005174fde13b4ff04ee1c0f33c6878",
            imageBig: "https://i.scdn.co/image/ab6761610000e5ebfde13b4ff04ee1c0f33c6878",
            genres: ["sertanejo", "pop brasileiro"],
            followers: 7000000,
            popularity: 80
        ),
        Artist(
            id: "2",
            name: "Veigh",
            image: "https://i.scdn.co/image/ab6761610000f1781e2e0eaf91cf96ee9a8d28f0",
            imageLarge: "https://i.scdn.co/image/ab676161000051741c548715daf25de6353b56f4",
            imageBig: "https://i.scdn.co/image/ab6761610000b2731c548715daf25de6353b56f4",
            genres: ["trap brasileiro", "trap", "hip hop brasileiro", "trap funk"],
            followers: 9000000,
            popularity: 82
        ),
        Artist(
            id: "3",
            name: "Artista Novo",
            image: "https://i.scdn.co/image/ab6761610000f178aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            imageLarge: "https://i.scdn.co/image/ab67616100005174aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            imageBig: "https://i.scdn.co/image/ab6761610000b273aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
            genres: ["indie"],
            followers: 10000,
            popularity: 35
        )
    ]
    
    static let sampleTracks = [
        Track(
            id: "1",
            name: "Morena",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-morena.mp3",
            albumName: "Luan City",
            albumId: "2",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            image: "https://i.scdn.co/image/ab67616d00001e02e4f6b6a3b4d8e63e6aaef243",
            spotifyUrl: "https://open.spotify.com/track/1morena",
            popularity: "90",
            durationMs: 210000
        ),
        Track(
            id: "2",
            name: "Abalo Emocional",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-abalo-emocional.mp3",
            albumName: "Luan City 2.0",
            albumId: "1",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            image: "https://i.scdn.co/image/ab67616d00001e0285cf7cbe1f8674bfc1b5d6d7",
            spotifyUrl: "https://open.spotify.com/track/2abalo-emocional",
            popularity: "85",
            durationMs: 195000
        ),
        Track(
            id: "3",
            name: "Sorria",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-sorria.mp3",
            albumName: "Sorria",
            albumId: "3",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            image: "https://i.scdn.co/image/ab67616d00001e02b2c0a75a1b6c6d4ab4146e2f",
            spotifyUrl: "https://open.spotify.com/track/3sorria",
            popularity: "70",
            durationMs: 230000
        ),
        Track(
            id: "4",
            name: "Escreve Aí",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-escreve-ai.mp3",
            albumName: "Acústico",
            albumId: "3",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            image: "https://i.scdn.co/image/ab67616d00001e0272f2ab0fa0d02ac50dd03329",
            spotifyUrl: "https://open.spotify.com/track/4escreve-ai",
            popularity: "65",
            durationMs: 215000
        ),
        Track(
            id: "5",
            name: "Te Esperando",
            previewUrl: "https://p.scdn.co/mp3-preview/luan-te-esperando.mp3",
            albumName: "O Nosso Tempo é Hoje",
            albumId: "99",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            image: "https://i.scdn.co/image/ab67616d00001e02ff3829b23111d3d27ee0d08e",
            spotifyUrl: "https://open.spotify.com/track/5te-esperando",
            popularity: "50",
            durationMs: 180000
        ),
        Track(
            id: "6",
            name: "Novo Balanço",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-novo-balanco.mp3",
            albumName: "Dos Prédios Deluxe",
            albumId: "4",
            artistId: "2",
            image: "https://i.scdn.co/image/ab67616d00001e02d8bb5db5ba823ca43fc63ed6",
            spotifyUrl: "https://open.spotify.com/track/6novo-balanco",
            popularity: "75",
            durationMs: 205000
        ),
        Track(
            id: "7",
            name: "Engana Dizendo Que Ama",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-engana.mp3",
            albumName: "Dos Prédios",
            albumId: "5",
            artistId: "2",
            image: "https://i.scdn.co/image/ab67616d00001e02888a6b12540e0cb31b295a77",
            spotifyUrl: "https://open.spotify.com/track/7engana",
            popularity: "65",
            durationMs: 220000
        ),
        Track(
            id: "8",
            name: "Pra Sempre",
            previewUrl: "https://p.scdn.co/mp3-preview/veigh-pra-sempre.mp3",
            albumName: "Dos Prédios",
            albumId: "5",
            artistId: "2",
            image: "https://i.scdn.co/image/ab67616d00001e02fa19c86e72abf03b4e2bcbb6",
            spotifyUrl: "https://open.spotify.com/track/8pra-sempre",
            popularity: "60",
            durationMs: 210000
        ),
        Track(
            id: "9",
            name: "Luzes da Cidade",
            previewUrl: nil,
            albumName: "Horizonte Azul",
            albumId: "6",
            artistId: "3",
            image: "https://i.scdn.co/image/ab67616d00001e02aaaaaaaabbbbbbbbcccccccc",
            spotifyUrl: "https://open.spotify.com/track/9luzes",
            popularity: "40",
            durationMs: 195000
        ),
        Track(
            id: "10",
            name: "Tempestade Solar",
            previewUrl: nil,
            albumName: "Tempestade",
            albumId: "7",
            artistId: "3",
            image: "https://i.scdn.co/image/ab67616d00001e02dddddddddddddddddddddddd",
            spotifyUrl: "https://open.spotify.com/track/10tempestade",
            popularity: "55",
            durationMs: 200000
        )
    ]
    
    static let sampleAlbums = [
        Album(
            id: "1",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            name: "Luan City 2.0",
            image: "https://i.scdn.co/image/ab67616d0000b2736ac7cb4f62dc68194f72e59a",
            releaseDate: "2023-03-17",
            totalTracks: 20
        ),
        Album(
            id: "2",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            name: "Luan City",
            image: "https://i.scdn.co/image/ab67616d0000b273b4a4a1ff2c213816ae0584c6",
            releaseDate: "2022-05-13",
            totalTracks: 19
        ),
        Album(
            id: "3",
            artistId: "7y97mc3bZRFXzT2szRM4L4",
            name: "Acústico",
            image: "https://i.scdn.co/image/ab67616d0000b2732d0f6c3a1a98d1e9f122a2c2",
            releaseDate: "2015-10-09",
            totalTracks: 15
        ),
        Album(
            id: "4",
            artistId: "2",
            name: "Dos Prédios Deluxe",
            image: "https://i.scdn.co/image/ab67616d0000b273a8e8dd195d644af3ee3a5b2d",
            releaseDate: "2023-06-01",
            totalTracks: 15
        ),
        Album(
            id: "5",
            artistId: "2",
            name: "Dos Prédios",
            image: "https://i.scdn.co/image/ab67616d0000b2732dfb4e15a72a9791a4dbb6eb",
            releaseDate: "2022-10-10",
            totalTracks: 12
        ),
        Album(
            id: "6",
            artistId: "3",
            name: "Horizonte Azul",
            image: "https://i.scdn.co/image/ab67616d0000b273bbbbbbbbbbbbbbbbbbbbbbbb",
            releaseDate: "2024-01-15",
            totalTracks: 8
        ),
        Album(
            id: "7",
            artistId: "3",
            name: "Tempestade",
            image: "https://i.scdn.co/image/ab67616d0000b273cccccccccccccccccccccccc",
            releaseDate: "2023-06-20",
            totalTracks: 10
        )
    ]
}
