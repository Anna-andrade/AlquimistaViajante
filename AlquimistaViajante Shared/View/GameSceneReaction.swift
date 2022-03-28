//
//  GameSceneReactiot.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneReaction: SKScene {
    
    lazy var arrayProduct:[Product] = [Product(lados: [3,nil]),Product(lados: [3,nil]),Product(lados: [3,nil])]
    
    override func didMove(to view: SKView) {
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
        var i = 0.0
        for product in arrayProduct {
                self.addChild(product)
                product.position = CGPoint(x: self.size.width/2, y: self.size.height/2+100-(i*150) )
            i += 1
        }
    }
    
    func setupScene(){
        removeAllChildren()
        let w = self.size.width
        let h = self.size.height
        
        let flaskNode = FlaskNode(imgName: "flatBottomFlask", size: CGSize(width: h, height: h))
        flaskNode.isUserInteractionEnabled = true
        flaskNode.delegate = self

    
        self.addChild(flaskNode)
        flaskNode.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)

        flaskNode.zPosition = 1
        drawBackgroundWall(side: 1050)
    }
    
    func eraseComponents(){
        for i in 0..<arrayProduct.count {
            if arrayProduct[i].isDead{
                arrayProduct.remove(at: i)
                break
            }
        }
    }

    func shake(){
            for product in arrayProduct {
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
        arrayProduct.append(product)
    }
}

