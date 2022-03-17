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
        flaskNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        flaskNode.size = CGSize(width: 900, height: 900)
        flaskNode.zPosition = 1
        
        let backgroundNode = SKSpriteNode(imageNamed: "Background")
        self.addChild(backgroundNode)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        backgroundNode.size = CGSize(width: 1050, height: 1050)
        backgroundNode.zPosition = 0
    }
    
}

