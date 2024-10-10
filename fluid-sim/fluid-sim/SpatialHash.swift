//
//  SpatialHash.swift
//  fluid-sim
//
//  Created by Mario Zuniga on 10/10/24.
//

import CoreGraphics

class SpatialHash {
    var cellSize: CGFloat
    var gridWidth: Int
    var gridHeight: Int
    var grid: [Int: [Particle]] = [:]
    
    init(canvasWidth: CGFloat, canvasHeight: CGFloat, cellSize: CGFloat) {
        self.cellSize = cellSize
        self.gridWidth = Int(canvasWidth / cellSize)
        self.gridHeight = Int(canvasHeight / cellSize)
    }
    
//    Function to hash particle to a grid position
    func hashPosition(_ position: CGPoint) -> Int {
        let cellX = Int(position.x / cellSize)
        let cellY = Int(position.y / cellSize)
        return cellX + cellY * gridWidth
    }
    
//    Insert a particle into the corresponding cell
    func insert(_ particle: Particle) {
        let hashKey = hashPosition(particle.position)
        if grid[hashKey] == nil {
            grid[hashKey] = []
        }
        grid[hashKey]?.append(particle)
    }
    
//    Get particles in the neighboring
//    func getNeighboringParticles(_ particle: Particle) -> [Particle] {
//        let cellX = Int(particle.position.x / cellSize)
//        let cellY = Int(particle.position.y / cellSize)
//        
//        var neighbors: [Particle] = []
//        
//        for dx in -1...1 {
//            for dy in -1...1 {
//                
//            }
//        }
//        return neighbors
//    }
    
}
