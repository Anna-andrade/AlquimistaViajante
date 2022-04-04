//
//  GameSceneReactiot.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    let GC = GameController.shared
    
    override func didMove(to view: SKView) {
        
        
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
    }
    
    func setupScene() {
        removeAllChildren()
        let w = self.size.width
        
        let flaskButton = FlaskButton(imgName: "flatBottomFlask", size: CGSize(width: w*0.5, height: w*0.5))
        self.addChild(flaskButton)
        flaskButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        flaskButton.zPosition = 2
        
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }

    func shake(){
        for product in GC.arrayProduct {
                product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -2000...2000), dy: Int.random(in: -2000...2000)))
        }
    }
}

extension GameSceneReaction:SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        guard let productAbsorvido = contact.bodyA.node as? Product  else { return }
        guard let productFinal = contact.bodyB.node as? Product  else { return }
        if (productFinal.isReact == false && productAbsorvido.isReact == false){
            productAbsorvido.selfDestroy()
            productFinal.absorved(product: productAbsorvido)
            GC.eraseComponents()
        }
        
    }
}

