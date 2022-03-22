//
//  GameSceneReactiot.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    lazy var arrayCompostos:[Composto] = [Composto(lados: [3,nil]),Composto(lados: [3,nil]),Composto(lados: [3,nil])]
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
        var i = 0.0
        for composto in arrayCompostos {
                self.addChild(composto)
                composto.position = CGPoint(x: self.size.width/2, y: self.size.height/2+150-(i*150) )
            i += 1
            composto.zPosition = 3
        }
    }
    
    func setupScene(){
        removeAllChildren()
        let size = CGSize(width: 600, height: 600)
        let flaskNode = FlaskNode(imgName: "flatBottomFlask", size: size)
        flaskNode.isUserInteractionEnabled = true
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
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
                composto.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -1000...1000), dy: Int.random(in: -1000...1000)))
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

