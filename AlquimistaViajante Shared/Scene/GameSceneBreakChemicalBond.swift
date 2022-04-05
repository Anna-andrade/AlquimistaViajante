//
//  GameSceneBreakChemicalBond.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneBreakChemicalBond: SKScene {
    
    let GC = GameController.shared
    var beakerNode: BeakerNode?
    lazy var backButton = addBackButton()
    
    var gesture = UITapGestureRecognizer()

    override func didMove(to view: SKView) {
        
        let width = self.size.width
        let height = self.size.height
             
        beakerNode = BeakerNode(size: CGSize(width: width*0.3, height: width*0.3))
        beakerNode?.position = CGPoint(x: width*0.492, y: height*0.55)
        beakerNode?.zPosition = 1
        beakerNode?.isUserInteractionEnabled = true
        beakerNode?.focusBehavior = .focusable
        #if (tvOS)
            beakerNode?.alpha = 0.75
        #endif
        guard let verBeakerNode = beakerNode else { return }
        addChild(verBeakerNode)
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        bunsenBurnerNode.size = CGSize(width: width*0.14, height: width*0.14)
        bunsenBurnerNode.position = CGPoint(x: width*0.5, y: height*0.15)
        addChild(bunsenBurnerNode)
        bunsenBurnerNode.zPosition = 1
        
        drawBackgroundWall(side: 1050)
        
        #if os(iOS)
            backButton = addBackButton()
        #endif
        #if os(tvOS)
        addTapGestureRecognizer()
        #endif
    }
    func assobrar() {
        for product in GC.arrayProduct {
            guard let verBeakerNode = beakerNode else { return }
            product.breakComposto(node: verBeakerNode, location: product.position)
            GC.eraseComponents()
        }
    }

#if os(tvOS)
    func addTapGestureRecognizer() {
        gesture.addTarget(self, action: #selector(clicked))
        self.view?.addGestureRecognizer(gesture)
    }
    @objc func clicked() {
        if let verBeaker = beakerNode {
            if backButton.isFocused == true {
                verBeaker.removeAllChildren()
                backButton.changeScene()
            } else if verBeaker.isFocused == true {
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
