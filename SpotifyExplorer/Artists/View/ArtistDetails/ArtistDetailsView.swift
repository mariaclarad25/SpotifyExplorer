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
    
    init(viewModel: ArtistDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.darkPurple, .purpleHighlight],
                           startPoint: .bottomLeading,
                           endPoint: .topLeading)
            .ignoresSafeArea()
            
            content
        }
           
        .navigationConfiguration()
        .onAppear {
            viewModel.fetchData()
        }
        .sheet(item: $selectedAlbum) { album in
            AlbumTrackView(album: album)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
                .scaleEffect(1.5)
                .tint(.greenCustom)
                .padding(.bottom, 20)
        } else if let errorMessage = viewModel.errorMessage {
            VStack {
                Text("Erro ao Carregar")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(errorMessage)
                    .font(.subheadline)
                    .foregroundColor(.grayLight)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        } else {
            mainScrollView
        }
    }
    
    private var mainScrollView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                headerSection
                
                contentSection
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
            }
        }
        .ignoresSafeArea()
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
                value: formatFollowers(viewModel.artist.followers?.total ?? 0))
            
            statDivider
            
            StatView(
                title: "Popularidade",
                value: "\(viewModel.artist.popularity ?? 0)")
            
            statDivider
            
            StatView(
                title: "Álbuns", 
                value: "\(viewModel.albums.count)")
        }
    }
    
    var statDivider: some View {
        Divider()
            .frame(height: 40)
            .background(Color.white)
    }
    
    var discographySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Discografia")
                .styleTitleScreenDatails()
            
            if viewModel.albums.isEmpty {
                Text("Nenhum álbum disponivel")
                    .foregroundColor(.grayLight)
            } else {
                albumsScrollView
            }
        }
    }
    
    var albumsScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 6) {
                ForEach(viewModel.albums) { album in
                    Button(action: {
                        selectedAlbum = album
                    }) {
                        CardAlbum(album: album)}
                }
            }
        }
        .frame(height: 280)
        .padding(.vertical, 6)
    }
    
    var topTracksSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Top faixas")
                .styleTitleScreenDatails()
               
            if viewModel.topTracks.isEmpty {
                Text("Nenhuma faixa disponível")
                    .foregroundColor(.grayLight)
            } else {
                ForEach(viewModel.topTracks) { track in
                    CardTracks(track: track)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Suporting View
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
        let artist = PreviewData.sampleArtists[0]
        let viewModel = ArtistDetailsViewModel(artist: artist)
    viewModel.albums = PreviewData.sampleAlbums.filter { $0.artists?.contains(where: { $0.id == artist.id }) ?? false}
        
        return ArtistDetailsView(viewModel: viewModel)
            .environmentObject(FavoritesViewModel())
}
