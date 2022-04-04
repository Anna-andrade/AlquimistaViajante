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
    
    var gesture = UITapGestureRecognizer()
    lazy var backButton = addBackButton()
    
    
    override func didMove(to view: SKView) {
        
        
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
    }
    
    func setupScene() {
        removeAllChildren()
        let w = self.size.width
        
        
        self.addChild(flaskButton)
        flaskButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        flaskButton.zPosition = 2
        
        drawBackgroundWall(side: 1050)
    }

    func shake(){
        for product in GC.arrayProduct {
                product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -2000...2000), dy: Int.random(in: -2000...2000)))
        }
    }
#if os(tvOS)
    func addTapGestureRecognizer(){
        gesture.addTarget(self, action: #selector(clicked))
        self.view?.addGestureRecognizer(gesture)
    }
    @objc func clicked(){
        
        if let verBeaker = beakerNode {
            if backButton.isFocused == true{
                backButton.changeScene()
                print("NAO ESTA FOCADO")
            }else if verBeaker.isFocused == true{
                assobrar()
            }
        }
        
        
    }
#endif
}
#if os(tvOS)
extension GameSceneBreakChemicalBond {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [backButton]
    }
    

}
#endif

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

