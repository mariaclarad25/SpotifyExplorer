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
    
    var body: some View {
        ZStack{
            Color(.darkPurple).ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Spotify Explorer")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.greenCustom)
                        .padding()
                    
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
                    
                    if viewModel.searchText.isEmpty {
                        Text("Artistas em Destaque")
                            .styleSubtitlesArtistView()
                            .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(viewModel.popularArtist) { artist in
                                    CardSuggestion(artist: artist)
                                }
                            }
                            .padding(.top, -16)
                        }
                        
                        
                        Text("Descubra Novos Talentos")
                            .styleSubtitlesArtistView()
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(viewModel.newArtist) { artist in
                                    CardSuggestion(artist: artist)
                                }
                            }
                            .padding(.top, -16)
                        }
                        
                        Text("Gêneros Musicais")
                            .styleSubtitlesArtistView()
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:18) {
                                ForEach(["Trap", "Pop", "Sertanejo", "Hip-Hop", "Pagode"], id: \.self) { genre in
                                    GenreButton(genre: genre) {
                                        print("Selecionado: \(genre)")
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom)
                        }
                    } else {
                        VStack(alignment: .leading) {
                            if viewModel.filteredArtists.isEmpty {
                                Text("Nenhum artista encontrado")
                                    .foregroundColor(.white)
                                    .padding()
                            } else {
                                ForEach(viewModel.filteredArtists) { artist in
                                    CardArtistView(artist: artist)
                                }
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    SearchArtistView()
        .environmentObject(FavoritesViewModel())
}
