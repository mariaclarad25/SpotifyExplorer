//
//  FloatingParticles.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 01/09/25.
//

import SwiftUI

struct ParticlesView: View {
    @State private var particles: [ParticleModel] = []
    
    private let particleCount = 15
    private let sizeRange = 3.0...8.0
    private let durationRange = 3.0...6.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles, id: \.id) { particle in
                    Circle()
                        .fill(Color.green.opacity(0.6))
                        .frame(width: particle.size, height: particle.size)
                        .position(x: particle.x, y: particle.y)
                        .animation(
                            .easeInOut(duration: particle.duration)
                            .repeatForever(autoreverses: true),
                            value: particle.y
                        )
                }
            }
            .onAppear {
                createParticles(in: geo.size)
            }
        }
    }
    
    private func createParticles(in size: CGSize) {
        var newParticles: [ParticleModel] = []
        
        for _ in 0..<particleCount {
            let particle = ParticleModel(
                x: Double.random(in: 0...size.width),
                y: Double.random(in: 0...size.height),
                size: Double.random(in: sizeRange),
                duration: Double.random(in: durationRange)
            )
            newParticles.append(particle)
        }
        
        particles = newParticles
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            for i in particles.indices {
                particles[i].y = Double.random(in: -50...size.height + 50)
            }
        }
    }
}

// MARK: - Particle Model
struct ParticleModel: Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    let size: Double
    let duration: Double
}

#Preview {
    ZStack {
        Color(.darkPurple).ignoresSafeArea()
        ParticlesView()
    }
}
