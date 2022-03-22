//
//  GameSceneReactiot.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    lazy var arrayCompostos:[Composto] = [Composto(lados: [3,nil])]
    
    var border: UIBezierPath {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y:50))
            path.addCurve(to: CGPoint(x: 0, y:-250), controlPoint1: CGPoint(x: 200, y: 50), controlPoint2: CGPoint(x: 200, y: -250))
            path.addCurve(to: CGPoint(x: 0, y: 50), controlPoint1: CGPoint(x: -200, y: -250), controlPoint2: CGPoint(x: -200, y: 50))
            return path
        }
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
        
        for composto in arrayCompostos {
                self.addChild(composto)
                composto.position = CGPoint(x: self.size.width/2, y: self.size.height/2-10)
            composto.zPosition = 3
        }
    }
    
    func setupScene(){
        removeAllChildren()
        let texture = SKTexture(imageNamed: "flatBottomFlask")
        texture.filteringMode = .nearest
        let size = CGSize(width: 600, height: 600)
        let flaskNode = SKSpriteNode(texture: texture, size: size)
        flaskNode.physicsBody = SKPhysicsBody (edgeLoopFrom: border.cgPath)
        flaskNode.physicsBody?.isDynamic = false
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

