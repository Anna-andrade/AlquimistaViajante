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

        let addBackButton = SKButtonNavigation(imageName: "backButton", sceneToGo: GameSceneLaboratory(), imagePress: "backButtonPress")
        addBackButton.size = CGSize(width: width*0.12, height: height*0.1)
        addBackButton.position = CGPoint(x: 140, y: 1080)
        addBackButton.zPosition = 2
        addBackButton.isUserInteractionEnabled = true
        addChild(addBackButton)
     
    }
}
