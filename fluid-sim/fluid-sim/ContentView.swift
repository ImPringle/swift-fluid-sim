//
//  ContentView.swift
//  fluid-sim
//
//  Created by Mario Zuniga on 10/9/24.
//

import SwiftUI


struct ContentView: View {
    @State private var canvasWidth: Double = 600
    @State private var canvasHeight: Double = 400
    let desiredFPS: Double = 60
    @State private var timer: Timer?
    @State private var particleRadius: CGFloat = 5
    
    @State private var particles: [Particle] = [
        Particle(position: CGPoint(x: 0, y: 0), velocity: CGVector(dx: 0, dy: 0), radius: CGFloat(particleRadius))
    ]
    
    func startTimer() {
        let frameDuration = 1.0 / desiredFPS
        
        // Create a timer that triggers updates based on desired FPS
        timer = Timer.scheduledTimer(withTimeInterval: frameDuration, repeats: true) { _ in
            updateParticles(size: CGSize(width: canvasWidth, height: canvasHeight))
        }
    }
    
    func updateParticles(size: CGSize) {
        for i in 0..<particles.count {
            var particle = particles[i]
            particle.position.x += particle.velocity.dx
            particle.position.y += particle.velocity.dy
            particles[i] = particle
        }
    }
    
    var body: some View {
        VStack {
//            HStack {
//                Slider(value: $canvasWidth, in: 0...1200, step: 10)
//                Slider(value: $canvasHeight, in: 0...800, step: 10)
//            }
            Canvas { context, size in
                for particle in particles {
                    let circle = Path(ellipseIn: CGRect(x: particle.position.x, y: particle.position.y, width: particleRadius*2, height: particleRadius*2))
                    context.fill(circle, with: .color(.blue))
                }
            }
            .frame(width: canvasWidth, height: canvasHeight)
            .background()
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
