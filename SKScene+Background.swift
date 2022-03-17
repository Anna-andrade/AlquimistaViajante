//
//  SKScene+Background.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 17/03/22.
//

import Foundation
import SpriteKit

extension SKScene {
    func drawBackgroundWall() {
        let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        
        for i in 0...width {
            for j in 0...height{
                let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
            }
        }
        
    }
    
}
