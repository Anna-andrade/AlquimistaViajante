//
//  GameSceneReaction.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    lazy var arrayCompostos:[Composto] = [Composto(lados: [3,nil])]
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
        
        for composto in arrayCompostos {
                self.addChild(composto)
                composto.position = CGPoint(x: Int.random(in: 50...200), y: Int.random(in: 50...700))
            composto.zPosition = 5
        }
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.categoryBitMask = 1
        self.physicsBody = border
    }
    
    func setupScene(){
        removeAllChildren()
        let flaskNode = SKSpriteNode(imageNamed: "flask")
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        flaskNode.size = CGSize(width: 400, height: 400)
        flaskNode.zPosition = 1
        drawBackgroundWall(side: 500)
    }
    
    func eraseComponents(){
        for i in 0..<arrayCompostos.count {
            if arrayCompostos[i].isDead{
                arrayCompostos.remove(at: i)
                break
            }
        }
    }
    
    func shake(){
            for composto in arrayCompostos {
                composto.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -500...500), dy: Int.random(in: -500...500)))
        }
    }
}

extension GameSceneReaction:SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        guard let compostoAbsorvido = contact.bodyA.node as? Composto  else { return }
        guard let compostoFinal = contact.bodyB.node as? Composto  else { return }
        if (compostoFinal.isReact == false && compostoAbsorvido.isReact == false){
            compostoAbsorvido.selfDestroy()
            compostoFinal.absorved(composto: compostoAbsorvido)
            eraseComponents()
        }
        
    }
}

