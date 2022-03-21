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
        let flaskNode = SKSpriteNode(imageNamed: "flatBottomFlask")
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        flaskNode.size = CGSize(width: 400, height: 400)
        flaskNode.zPosition = 1
        drawBackgroundWall(side: 500)
    }
    
}

