//
//  SearchArtistView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct SearchArtistView: View {
    @StateObject private var viewModel = SearchArtistViewModel()
    @State private var selectedGenre: IdentifiableString?
    @FocusState private var searchFieldIsFocused: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.darkPurple).ignoresSafeArea()
                
                contentScrollView
            }
        }
        .tint(.lightPurple)
        .sheet(item: $selectedGenre, content: genreSheet)
        .navigationBarHidden(true)
        .onDisappear {
            viewModel.searchTask?.cancel()
            viewModel.isLoading = false
        }
    }
}

// MARK: - Components
private extension SearchArtistView {
    var contentScrollView: some View {
        Group {
            if viewModel.isLoading && viewModel.searchText.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .greenCustom))
                    .scaleEffect(2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    VStack {
                        headerSection
                        searchBarSection
                        
                        if !viewModel.showingSearchResults {
                            discoverySections
                        } else {
                            searchResultsSection
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
            }
        }
    }
    
    var headerSection: some View {
        Text("Spotify Explorer")
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(.greenCustom)
            .padding(.top, 80)
    }
    
    var searchBarSection: some View {
        HStack {
            ZStack(alignment: .leading) {
                if viewModel.searchText.isEmpty {
                    Text("Pesquisar")
                        .foregroundColor(.gray)
                        .allowsHitTesting(false)
                }
                
                TextField("", text: $viewModel.searchText)
                    .foregroundColor(.black)
                    .focused($searchFieldIsFocused)
            }
            
            if viewModel.isLoading && viewModel.showingSearchResults {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(0.8)
            } else {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.gray))
            }
        }
        .padding(10)
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: - Discovery Sections
private extension SearchArtistView {
    var discoverySections: some View {
        VStack{
            featuredArtistsSection
            newTalentsSection
            genresSection
        }
    }
    
    var featuredArtistsSection: some View {
        VStack{
            Text("Artistas em Destaque")
                .styleSubtitlesArtistView()
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel.featuredArtists, id: \.id) { artist in
                        NavigationLink(destination: ArtistDetailsView(viewModel: ArtistDetailsViewModel(artist: artist))) {
                            CardSuggestion(artist: artist)
                        }
                    }
                }
                .padding(.top, -16)
            }
        }
    }
    
    var newTalentsSection: some View {
        VStack{
            Text("Descubra Talentos")
                .styleSubtitlesArtistView()
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel.recommendedArtist, id: \.id) { artist in
                        NavigationLink(destination: ArtistDetailsView(viewModel: ArtistDetailsViewModel(artist: artist))) {
                            CardSuggestion(artist: artist)
                        }
                    }
                }
                .padding(.top, -16)
            }
        }
    }
    
    var genresSection: some View {
        VStack{
            Text("Gêneros Musicais")
                .styleSubtitlesArtistView()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:18) {
                    ForEach(["Trap", "Pop", "Sertanejo", "Hip-Hop", "Pagode"], id: \.self) { genre in
                        GenreButton(genre: genre) {
                            selectedGenre = IdentifiableString(value: genre)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom)
            }
        }
    }
}

// MARK: - Search Results Section
private extension SearchArtistView {
    var searchResultsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            if !viewModel.searchText.isEmpty {
                Text("Resultados para \"\(viewModel.searchText)\"")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            
            if viewModel.isLoading {
                HStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .greenCustom))
                        .scaleEffect(0.8)
                    Text("Buscando...")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
            } else if viewModel.didPerformSearch && viewModel.searchResults.isEmpty {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    
                    Text("Nenhum artista encontrado")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.searchResults, id: \.id) { artist in
                        NavigationLink(destination: ArtistDetailsView(viewModel: ArtistDetailsViewModel(artist: artist))) {
                            CardArtistView(artist: artist)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Function
private extension SearchArtistView {
    func genreSheet(genre: IdentifiableString) -> some View {
        ListGenreView(genre: genre.value)
    }
}

// MARK: - Supporting Types
struct IdentifiableString: Identifiable {
    let id = UUID()
    let value: String
}

#Preview {
    SearchArtistView()
        .environmentObject(FavoritesViewModel())
}
