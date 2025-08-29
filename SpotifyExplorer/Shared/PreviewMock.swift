//
//  PreviewMock.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 28/08/25.
//

import Foundation

struct PreviewData {
    static let sampleArtists: [Artist] = [
        Artist(
            id: "7y97mc3bZRFXzT2szRM4L4",
            name: "Luan Santana",
            genres: ["sertanejo", "pop brasileiro"],
            images: [
                SpotifyImage(url: "https://i.scdn.co/image/ab6761610000f178fde13b4ff04ee1c0f33c6878", height: 64, width: 64),
                SpotifyImage(url: "https://i.scdn.co/image/ab67616100005174fde13b4ff04ee1c0f33c6878", height: 300, width: 300)
            ],
            followers: Followers(href: "", total: 7000000),
            popularity: 80,
            external_urls: SpotifyExternalURLs(spotify: "https://open.spotify.com/artist/7y97mc3bZRFXzT2szRM4L4")
        ),
        Artist(
            id: "2",
            name: "Veigh",
            genres: ["trap brasileiro", "trap", "hip hop brasileiro", "trap funk"],
            images: [
                SpotifyImage(url: "https://i.scdn.co/image/ab6761610000f1781e2e0eaf91cf96ee9a8d28f0", height: 64, width: 64),
                SpotifyImage(url: "https://i.scdn.co/image/ab676161000051741c548715daf25de6353b56f4", height: 300, width: 300)
            ],
            followers: Followers(href: "", total: 9000000),
            popularity: 82,
            external_urls: SpotifyExternalURLs(spotify: "https://open.spotify.com/artist/2")
        ),
        Artist(
            id: "3",
            name: "Artista Novo",
            genres: ["indie"],
            images: [
                SpotifyImage(url: "https://i.scdn.co/image/ab6761610000f178aaaaaaaaaaaaaaaaaaaaaaaaaaaa", height: 64, width: 64)
            ],
            followers: Followers(href: "", total: 10000),
            popularity: 35,
            external_urls: SpotifyExternalURLs(spotify: "https://open.spotify.com/artist/3")
        )
    ]

    static let sampleAlbums: [Album] = [
        Album(
            id: "1",
            name: "Luan City 2.0",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b2736ac7cb4f62dc68194f72e59a", height: 300, width: 300)],
            release_date: "2023-03-17",
            total_tracks: 20,
            artists: [sampleArtists[0]]
        ),
        Album(
            id: "2",
            name: "Luan City",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b273b4a4a1ff2c213816ae0584c6", height: 300, width: 300)],
            release_date: "2022-05-13",
            total_tracks: 19,
            artists: [sampleArtists[0]]
        ),
        Album(
            id: "3",
            name: "Acústico",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b2732d0f6c3a1a98d1e9f122a2c2", height: 300, width: 300)],
            release_date: "2015-10-09",
            total_tracks: 15,
            artists: [sampleArtists[0]]
        ),
        Album(
            id: "4",
            name: "Dos Prédios Deluxe",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b273a8e8dd195d644af3ee3a5b2d", height: 300, width: 300)],
            release_date: "2023-06-01",
            total_tracks: 15,
            artists: [sampleArtists[1]]
        ),
        Album(
            id: "5",
            name: "Dos Prédios",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b2732dfb4e15a72a9791a4dbb6eb", height: 300, width: 300)],
                        release_date: "2022-10-10",
            total_tracks: 12,
            artists: [sampleArtists[1]]
        ),
        Album(
            id: "6",
            name: "Horizonte Azul",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b273bbbbbbbbbbbbbbbbbbbbbbbb", height: 300, width: 300)],
                        release_date: "2024-01-15",
            total_tracks: 8,
            artists: [sampleArtists[2]]
        ),
        Album(
            id: "7",
            name: "Tempestade",
            images: [SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b273cccccccccccccccccccccccc", height: 300, width: 300)],
                        release_date: "2023-06-20",
            total_tracks: 10,
            artists: [sampleArtists[2]]
        )
    ]

    static let sampleTracks: [Track] = [
        Track(
            id: "1",
            name: "Morena",
            artists: [sampleArtists[0]],
            album: sampleAlbums[1],
            popularity: 90,
            durationMs: 210000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/1morena")
        ),
        Track(
            id: "2",
            name: "Abalo Emocional",
            artists: [sampleArtists[0]],
            album: sampleAlbums[0],
            popularity: 85,
            durationMs: 195000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/2abalo-emocional")
        ),
        Track(
            id: "6",
            name: "Novo Balanço",
            artists: [sampleArtists[1]],
            album: sampleAlbums[3],
            popularity: 75,
            durationMs: 205000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/6novo-balanco")
        ),
        Track(
            id: "7",
            name: "Engana Dizendo Que Ama",
            artists: [sampleArtists[1]],
            album: sampleAlbums[4],
            popularity: 65,
            durationMs: 220000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/7engana")
        ),
        Track(
            id: "8",
            name: "Pra Sempre",
            artists: [sampleArtists[1]],
            album: sampleAlbums[4],
            popularity: 60,
            durationMs: 210000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/8pra-sempre")
        ),
        Track(
            id: "9",
            name: "Luzes da Cidade",
            artists: [sampleArtists[2]],
            album: sampleAlbums[5],
            popularity: 40,
            durationMs: 195000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/9luzes")
        ),
        Track(
            id: "10",
            name: "Tempestade Solar",
            artists: [sampleArtists[2]],
            album: sampleAlbums[6],
            popularity: 55,
            durationMs: 200000,
            externalUrls: SpotifyExternalURLs(spotify: "https://open.spotify.com/track/10tempestade")
        )
    ]
}
