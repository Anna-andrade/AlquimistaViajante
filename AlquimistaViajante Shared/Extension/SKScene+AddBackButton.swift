//
//  SKScene+AddBackButton.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 24/03/22.
//

import Foundation
import SpriteKit

extension SKScene {
    func addBackButton() -> SKButtonNavigation {
        let width = self.size.width
        let height = self.size.height

        let addBackButton = SKButtonNavigation(imageName: "backButton", sceneToGo: GameSceneLaboratory(), imagePress: "backButtonPress",tutorialFase: 0)
        addBackButton.size = CGSize(width: width*0.1, height: width*0.1)
        addBackButton.position = CGPoint(x: width*0.1, y: height*0.9)
        addBackButton.zPosition = 2
        addChild(addBackButton)
        #if os(tvOS)
            addBackButton.alpha = 0.75
        #endif
        return addBackButton
    }
}
