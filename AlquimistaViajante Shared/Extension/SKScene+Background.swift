//
//  SKScene+Background.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 17/03/22.
//
// Tentando dar commit

import Foundation
import SpriteKit

extension SKScene {
    
    func drawBackgroundWall(side: CGFloat) {
        let width = self.size.width
        let height = self.size.height
        
        for i in 0...Int(width/side)+1 {
            for j in 0...Int(height/side)+1{
                let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
                backgroundWallNode.size = CGSize(width: width, height: height)
                addChild(backgroundWallNode)
                backgroundWallNode.position = CGPoint (x: backgroundWallNode.size.width*CGFloat(i), y: backgroundWallNode.size.height*CGFloat(j))
                backgroundWallNode.zPosition = -2
                
            }
        }
    }
        func drawBackgroundFloor(side: CGFloat) {
            let width = self.size.width
            let height = self.size.height
            
            let backgroundWallNode = SKSpriteNode(imageNamed: "Background")
            backgroundWallNode.size = CGSize(width: width, height: height)
            addChild(backgroundWallNode)
            backgroundWallNode.position = CGPoint (x: backgroundWallNode.size.width*0.5, y: backgroundWallNode.size.height*0.5)
            backgroundWallNode.zPosition = -3
            
            let backgroundFloorNode = SKSpriteNode(imageNamed: "floor")
            backgroundFloorNode.size = CGSize(width: width, height: height/2)
            addChild(backgroundFloorNode)
            backgroundFloorNode.position = CGPoint (x: width*0.5, y: height*0.18)
            backgroundFloorNode.zPosition = -1
        
        
    }
    
    func drawBackgroundBook(side: CGFloat){
        let width = self.size.width
        let height = self.size.height
        
        let backgroundBookNode = SKSpriteNode(imageNamed: "bookBackgroundNode")
        backgroundBookNode.size = CGSize(width: width, height: height)
        addChild(backgroundBookNode)
        backgroundBookNode.position = CGPoint (x: self.size.width*0.5, y: self.size.height*0.5)
        backgroundBookNode.zPosition = -1 
        
    }
}
