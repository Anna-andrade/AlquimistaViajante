//
//  GameSceneReaction.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    override func didMove(to view: SKView) {
        let w = self.size.width
        let h = self.size.height
        
        let flaskNode = SKSpriteNode(imageNamed: "flatBottomFlask")
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        flaskNode.size = CGSize(width: w, height: h)
        flaskNode.zPosition = 1
        drawBackgroundWall(side: 1050)
    }
    
}

