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
        
        for i in 0...Int(width/side)+1 {
            for j in 0...Int(height/side)+1{
                let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
                backgroundWallNode.size = CGSize(width: side, height: side)
                addChild(backgroundWallNode)
                backgroundWallNode.position = CGPoint (x: backgroundWallNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                backgroundWallNode.zPosition = -1
                
            }
        }
        func drawBackgroundFloor(side: CGFloat) {
            let width = self.size.width
            let height = self.size.height
            
            for i in 0...Int(width/side)+1 {
                for j in 0...Int(height/side)+1{
                    let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
                    backgroundWallNode.size = CGSize(width: side, height: side)
                    addChild(backgroundWallNode)
                    backgroundWallNode.position = CGPoint (x: backgroundWallNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                    backgroundWallNode.zPosition = -1
                    
                    let backgroundFloorNode = SKSpriteNode(imageNamed: "floor")
                    backgroundFloorNode.size = CGSize(width: side, height: side/2)
                    addChild(backgroundFloorNode)
                    backgroundFloorNode.position = CGPoint (x: backgroundFloorNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                    backgroundFloorNode.zPosition = 0
                }
            }
            
        }
        
    }
}
