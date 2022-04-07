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
    
    lazy var w = self.size.width
    lazy var h = self.size.height
    lazy var backButton = addBackButton()
    lazy var flaskButton = FlaskButton(imgName: "flatBottomFlask", size: CGSize(width: w*0.5, height: w*0.5))
    
    override func didMove(to view: SKView) {
        
        self.isUserInteractionEnabled = true
        physicsWorld.contactDelegate = self
        
        setupScene()
    }
    
    func setupScene() {
        removeAllChildren()
        
        self.addChild(flaskButton)
        flaskButton.position = CGPoint(x: w*0.5, y: h*0.5)
        flaskButton.zPosition = 4
        flaskButton.isUserInteractionEnabled = true
        flaskButton.focusBehavior = .focusable
        
        #if os(tvOS)
        flaskButton.alpha = 0.75
        addTapGestureRecognizer()
        #endif
        
        #if os(iOS)
        backButton = addBackButton()
        #endif
        
        drawBackgroundWall(side: 1050)
        addLabelMini(title: "oi", text: "jkodvmsomov")
    }

    func shake() {
        for product in GC.arrayProduct {
        #if os(iOS)
            product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -2000...2000), dy: Int.random(in: -2000...2000)))
        #else
            product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -1000...1000), dy: Int.random(in: -1000...1000)))
        #endif
        }
    }
#if os(tvOS)
    func addTapGestureRecognizer() {
        gesture.addTarget(self, action: #selector(clicked))
        self.view?.addGestureRecognizer(gesture)
    }
    @objc func clicked() {
        
            if backButton.isFocused == true {
                flaskButton.removeAllChildren()
                backButton.changeScene()
            } else if flaskButton.isFocused == true {
                shake()
            }
        }
#endif
}
#if os(tvOS)
extension GameSceneReaction {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [backButton]
    }
    
}
#endif

extension GameSceneReaction: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let productAbsorvido = contact.bodyA.node as? Product  else { return }
        guard let productFinal = contact.bodyB.node as? Product  else { return }
        if productFinal.isReact == false && productAbsorvido.isReact == false {
            productAbsorvido.selfDestroy()
            productFinal.absorved(product: productAbsorvido)
            GC.eraseComponents()
        }
    }
}
