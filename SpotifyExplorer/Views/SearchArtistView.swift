//
//  SearchArtistView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct SearchArtistView: View {
    @StateObject private var viewModel = SearchArtistViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State private var selectedGenre: IdentifiableString?
    
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
    }
}

// MARK: - Components
private extension SearchArtistView {
    var contentScrollView: some View {
        ScrollView {
            VStack {
                headerSection
                searchBarSection
                
                if viewModel.searchText.isEmpty {
                    discoverySections
                } else {
                    searchResultsSection
                }
            }
        }
    }
    
    var headerSection: some View {
        Text("Spotify Explorer")
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(.greenCustom)
            .padding()
    }
    
    var searchBarSection: some View {
        HStack {
            ZStack(alignment: .leading) {
                if viewModel.searchText.isEmpty {
                    Text("Pesquisar")
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $viewModel.searchText)
                    .foregroundColor(.black)
            }
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(.gray))
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
                    ForEach(viewModel.popularArtist) { artist in
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
            Text("Descubra Novos Talentos")
                .styleSubtitlesArtistView()
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel.newArtist) { artist in
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
        VStack(alignment: .leading) {
            if viewModel.filteredArtists.isEmpty {
                Text("Nenhum artista encontrado")
                    .foregroundColor(.white)
                    .padding()
            } else {
                ForEach(viewModel.filteredArtists) { artist in
                    NavigationLink(destination: ArtistDetailsView(viewModel: ArtistDetailsViewModel(artist: artist))) {
                        CardArtistView(artist: artist)
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - Helper Functions
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
