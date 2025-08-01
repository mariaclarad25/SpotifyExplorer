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
        NavigationView{
            ZStack{
                Color(.darkPurple).ignoresSafeArea()
                
                VStack(spacing: 30) {
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
                    
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .fill(Color.lightPurple.opacity(0.7))
                            .frame(width: 220, height: 220)
                            .blur(radius: 50)
                        
                        Image("SpotifyLogoImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .scaleEffect(pulse ? 1.05 : 0.95)
                            .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: pulse)
                    }
                    .onAppear() {
                        pulse = true
                    }
                    
                    Text("Encontre seus artistas e músicas favoritas!")
                        .foregroundStyle(Color(.lightPurple))
                        .font(.system(size: 26))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: TabBarView()) {
                        Text("Quero começar!")
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
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
