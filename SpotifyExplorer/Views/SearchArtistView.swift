//
//  SearchArtistView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 29/07/25.
//

import SwiftUI

struct SearchArtistView: View {
    @State private var searchBar = ""
    
    let popularArtists = MockData.sampleArtist.filter { $0.popularity > 70 }
    let newArtists = MockData.sampleArtist.filter { $0.popularity <= 70 }
    
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
                            if searchBar.isEmpty {
                                Text("Pesquisar")
                                    .foregroundColor(.gray)
                            }
                            
                            TextField("", text: $searchBar)
                                .foregroundColor(.black)
                        }
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(.gray))
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                    .padding(.horizontal)

                    Text("Artistas em Destaque")
                        .styleSubtitlesArtistView()
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(popularArtists) { artist in
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
                            ForEach(newArtists) { artist in
                                CardSuggestion(artist: artist)
                            }
                        }
                        .padding(.top, -16)
                    }
                    
                    Text("Genêros Musicais")
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
                        
                        Spacer()
                    }
                    
                    ScrollView{
                        if searchBar.lowercased() == MockData.sampleArtist[0].name.lowercased() {
                            CardArtistView()
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SearchArtistView()
}
