//
//  FloatingParticles.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 12/09/25.
//

import SwiftUI

struct ParticlesView: View {
    @State private var particles: [ParticleModel] = []
    
    private let particleCount = 20
    private let sizeRange = 3.0...10.0
    private let durationRange = 3.0...6.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles.indices, id: \.self) { i in
                    Circle()
                        .fill(Color.green.opacity(0.6))
                        .frame(width: particles[i].size, height: particles[i].size)
                        .position(x: particles[i].x, y: particles[i].currentY)
                }
            }
            .onAppear {
                createParticles(in: geo.size)
                startAnimation()
            }
            .onDisappear {
                stopAnimation()
            }
        }
    }
    
    // MARK: - Animations
    private func startAnimation() {
        for i in particles.indices {
            animateParticle(at: i)
        }
    }
    
    private func animateParticle(at index: Int) {
        guard particles.indices.contains(index) else { return }
        
        let duration = particles[index].duration
        let minY = 0.0
        let maxY = UIScreen.main.bounds.height + 50
        
        withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            particles[index].currentY = Double.random(in: minY...maxY)
        }
    }
    
    private func stopAnimation() {
        for i in particles.indices {
            withAnimation(.none) {
                particles[i].currentY = particles[i].y
            }
        }
    }
    
    // MARK: - Create particles
    private func createParticles(in size: CGSize) {
        var newParticles: [ParticleModel] = []
        
        for _ in 0..<particleCount {
            let yStart = Double.random(in: 0...size.height)
            
            let particle = ParticleModel(
                x: Double.random(in: 0...size.width),
                y: yStart,
                currentY: yStart,
                size: Double.random(in: sizeRange),
                duration: Double.random(in: durationRange)
            )
            newParticles.append(particle)
        }
        
        particles = newParticles
    }
}

// MARK: - Particle Model
struct ParticleModel: Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    var currentY: Double
    let size: Double
    let duration: Double
}

#Preview {
    ZStack{
        Color(.darkPurple).ignoresSafeArea()
        ParticlesView()
    }
}
