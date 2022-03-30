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
        var i = 0.0
        for product in GC.arrayProduct {
                self.addChild(product)
                product.position = CGPoint(x: self.size.width/2, y: self.size.height/2+100-(i*150) )
            i += 1
        }
    }
    
    func setupScene(){
        removeAllChildren()
        let w = self.size.width
        let h = self.size.height
        
        let flaskButton = FlaskButton(imgName: "flatBottomFlask", size: CGSize(width: w, height: h))
        flaskButton.isUserInteractionEnabled = true
        flaskButton.delegate = self

    
        self.addChild(flaskButton)
        flaskButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)

        flaskButton.zPosition = 1
        drawBackgroundWall(side: 1050)
        addBackButton()
    }
    
    func eraseComponents(){
        for i in 0..<GC.arrayProduct.count {
            if GC.arrayProduct[i].isDead{
                GC.arrayProduct.remove(at: i)
                break
            }
        }
    }

    func shake(){
        for product in GC.arrayProduct {
                product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -1000...1000), dy: Int.random(in: -1000...1000)))
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
            eraseComponents()
        }
        
    }
}
extension GameSceneReaction:AddProductsDelegate{
    func addProducts(product: Product) {
        GC.arrayProduct.append(product)
    }
}

