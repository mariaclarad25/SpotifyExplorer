//
//  ArtistDetailsView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/08/25.
//

import SwiftUI

struct ArtistDetailsView: View {
    @StateObject private var viewModel: ArtistDetailsViewModel
    @State private var selectedAlbum: Album? = nil
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: ArtistDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                headerSection
                
                contentSection
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
            }
        }
        .ignoresSafeArea()
        .background(
            LinearGradient(colors: [.darkPurple, .purpleHighlight],
                           startPoint: .bottomLeading,
                           endPoint: .topLeading)
        )
        .navigationConfiguration()
        .sheet(item: $selectedAlbum) { album in
            AlbumTrackView(
                album: album,
                tracks: viewModel.tracksForAlbum(album.id)
            )
        }
    }
}

// MARK: - Components

private extension ArtistDetailsView {
    var headerSection: some View {
        DetailsScreenHeader(artist: viewModel.artist)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
    }
    
    var contentSection: some View {
            VStack(spacing: 24) {
                artistStatsSection
                discographySection
                topTracksSection
            }
        }
    
    var artistStatsSection: some View {
        HStack(spacing: 24) {
            
            StatView(
                title: "Seguidores",
                value: formatFollowers(viewModel.artist.followers))
            
            statDivider
            
            StatView(
                title: "Popularidade",
                value: "\(viewModel.artist.popularity)")
            
            statDivider
            
            StatView(
                title: "Álbuns", 
                value: "\(viewModel.albumsForArtist.count)")
        }
    }
    
    var statDivider: some View {
        Divider()
            .frame(height: 40)
            .background(Color.white.opacity(0.12))
    }
    
    var discographySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("Discografia")
            
            if viewModel.albumsForArtist.isEmpty {
                Text("Nenhum álbum disponivel")
                    .foregroundColor(.grayLight)
            } else {
                albumsScrollView
            }
        }
    }
    
    var albumsScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(viewModel.albumsForArtist) { album in
                    Button(action: {
                        selectedAlbum = album
                    }) {
                        CardAlbum(album: album)}
                }
            }
        }
        .frame(height: 230)
        .padding(.vertical, 6)
    }
    
    var topTracksSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader("Top faixas")
               
            if viewModel.tracksForArtist.isEmpty {
                Text("Nenhuma faixa disponível")
                    .foregroundColor(.grayLight)
            } else {
                ForEach(viewModel.tracksForArtist) { track in
                    CardTracks(track: track)
                }
            }
        }
    }
    
    func sectionHeader(_ title: String) -> some View {
           Text(title)
               .font(.system(size: 24, weight: .semibold))
               .foregroundColor(.white)
       }
}

// MARK: - View Modifiers

private extension View {
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

// MARK: - Suporting Views

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

private struct StatView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.grayLight)
        }
    }
}

#Preview {
    let sampleArtist = MockData.sampleArtist[0]
    let viewModel = ArtistDetailsViewModel(artist: sampleArtist)
    return ArtistDetailsView(viewModel: viewModel)
        .environmentObject(FavoritesViewModel())
}
