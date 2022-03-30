//
//  SKScene+AddBackButton.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 24/03/22.
//

import Foundation
import SpriteKit

extension SKScene {
    func addBackButton(){
        let width = self.size.width
        let height = self.size.height
        
        let addBackButton = SKButtonNavigation(imageName: "musicButton", sceneToGo: GameSceneLaboratory())
        addBackButton.size = CGSize(width: width*0.15, height: height*0.15)
        addBackButton.position = CGPoint(x: 100, y: 100)
        addBackButton.zPosition = 1
        addBackButton.isUserInteractionEnabled = true
        addChild(addBackButton)
     
    }
}
