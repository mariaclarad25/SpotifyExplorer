//
//  ContentView.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 28/07/25.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var pulse = false
    @State private var nameOpacity = 0.0
    @State private var nameOffset: CGFloat = -100
    
    var body: some View {
        NavigationStack{
            ZStack{
                DecorationHomeView()
                
                VStack(spacing: 30) {
                    nameSpotifyImage
                    
                    Spacer()
                    
                    ZStack{
                        circleShadow
                        brandSporifyImage
                    }
                    .onAppear() {
                        pulse = true
                    }
                    .onDisappear {
                        pulse = false
                    }
                    attractiveText
                    
                    Spacer()
                    
                    startButton
                }
                .padding(.horizontal)
            }
        }
    }
}

//MARK: - Components
private extension HomeScreenView {
    var nameSpotifyImage: some View {
        Image("SpotifyNameImage")
            .resizable()
            .scaledToFit()
            .padding(.top, 40)
            .opacity(nameOpacity)
            .offset(y: nameOffset)
            .onAppear {
                withAnimation(.easeOut(duration: 2.0)) {
                    nameOpacity = 1.0
                    nameOffset = 0
                }
            }
    }
    
    var circleShadow: some View {
        Circle()
            .fill(Color.lightPurple.opacity(0.6))
            .frame(width: 220, height: 220)
            .blur(radius: 50)
    }
    
    var brandSporifyImage: some View {
        Image("SpotifyLogoImage")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
            .scaleEffect(pulse ? 1.05 : 0.95)
            .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: pulse)
    }
    
    var attractiveText: some View {
        Text("Encontre seus artistas e músicas favoritas!")
            .foregroundStyle(Color(.lightPurple))
            .font(.system(size: 26))
            .multilineTextAlignment(.center)
            .padding(.top, 20)
    }
    
    var startButton: some View {
        NavigationLink(destination: TabBarView()) {
            Text("Começar!")
                .font(.system(size: 26))
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkPurple))
                .frame(width: 300, height: 60)
                .background((LinearGradient(
                    colors: [Color.lightPurple, Color.green],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)))
                .cornerRadius(50)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    HomeScreenView()
        .environmentObject(FavoritesViewModel())
}
