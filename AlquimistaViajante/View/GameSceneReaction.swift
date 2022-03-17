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
        let flaskNode = SKSpriteNode(imageNamed: "flask")
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: 50, y: 50)
        flaskNode.size = CGSize(width: 50, height: 50)
        
        let background = SKSpriteNode(imageNamed: "Background")
        self.addChild(background)
        background.position = CGPoint(
    }
    
}

