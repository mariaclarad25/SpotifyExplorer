//
//  ListGenreView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 04/08/25.
//

import SwiftUI

struct ListGenreView: View {
    let genre: String
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @StateObject private var viewModel: GenrerAtistsViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(genre: String) {
        self.genre = genre
        self._viewModel = StateObject(wrappedValue: GenrerAtistsViewModel(genre: genre))
    }
    
    var body: some View {
        ZStack {
            Color(.darkPurple).ignoresSafeArea()
            
            VStack {
                headerSection
                mainContentSection
            }
        }
        .tint(.lightPurple)
    }
}

// MARK: - Components
private extension ListGenreView {
    var headerSection: some View {
        Text(genre.capitalized)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.greenCustom)
            .frame(alignment: .center)
            .padding(.top, 10)
            .padding(.bottom, 20)
    }
    
    var mainContentSection: some View {
        Group{
            if viewModel.isLoading {
                loadingSection
            } else if viewModel.artists.isEmpty {
                emptyStateSection
            } else {
                artistListSection
            }
        }
    }
}

// MARK: - Content States
private extension ListGenreView {
    var loadingSection: some View {
        VStack{
            Spacer()
            VStack {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.greenCustom)
                    .padding(.bottom, 20)
                Text("Carregando artistas...")
                    .font(.body)
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
    
    var emptyStateSection: some View {
        VStack{
            Spacer()
            VStack(spacing: 16) {
                Image(systemName: "music.note")
                    .font(.system(size: 60))
                    .foregroundColor(.gray)
                Text("Nenhum artista encontrado")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("para o gênero \(genre.capitalized)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
    
    var artistListSection: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.artists, id: \.id) { artist in
                    CardArtistView(artist: artist)
                        .id(artist.id)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
}

#Preview() {
    ListGenreView(genre: "Sertanejo")
        .environmentObject(FavoritesViewModel())
}
