//
//  SKScene+NagationDelegate.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 24/03/22.
//

import Foundation
import SpriteKit

extension SKScene: NavigationDelegate{
    func navigationAction(scene: SKScene) {
        print("oi")
        scene.size = CGSize(width:  self.size.height, height: self.size.height)
        self.view?.presentScene(scene)
    }
}

extension SKScene: ChangeTextureButtonDelegate {
    func changeTextureButton(button: SKButtonNavigation) {
        button.removeFromParent()
        addChild(button)
    }
    
}
