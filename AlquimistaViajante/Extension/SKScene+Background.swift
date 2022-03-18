//
//  SKScene+Background.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 17/03/22.
//

import Foundation
import SpriteKit

extension SKScene {
    func drawBackgroundWall(side: CGFloat) {
        let width = self.size.width
        let height = self.size.height
        
        for i in 0...Int(width/side) {
            for j in 0...Int(height/side){
                let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
                addChild(backgroundWallNode)
                backgroundWallNode.position = CGPoint (x: backgroundWallNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                backgroundWallNode.zPosition = -1
                
            }
        }
        
    }
    
}
