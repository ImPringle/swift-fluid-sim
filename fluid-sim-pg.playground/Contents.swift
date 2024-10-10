import CoreGraphics

class Particle {
    var position: CGPoint
    var velocity: CGVector
    var radius: CGFloat
    
    init(position: CGPoint, velocity: CGVector, radius: CGFloat) {
        self.position = position
        self.velocity = velocity
        self.radius = radius
    }
    
    func display () {
        print("Particle position: (\(position.x), \(position.y))")
    }
}

class Plane2D {
    var width: Int
    var height: Int
    var particles: [Particle]
    
    init(width: Int, height: Int, particleCount: Int) {
        self.width = width
        self.height = height
        self.particles = []
        
        for _ in 0..<particleCount {
            let randomX = Int.random(in: 0..<width)
            let randomY = Int.random(in: 0..<height)
            particles.append(Particle(position: CGPoint(x: randomX, y: randomY), velocity: CGVector(dx: 0, dy: 0), radius: CGFloat(5)))
        }
    }
}


