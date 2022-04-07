//
//  TrashButton.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 04/04/22.
//

import Foundation
import SpriteKit

class TrashButton: SKButtonNavigation {
    
    let GC  = GameController.shared
    
    init( scene: SKScene) {
        super.init(imageName: "trash", sceneToGo: scene, tutorialFase: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        deleteProducts()
    }
    
    func deleteProducts() {
        GC.arrayProduct = []
    }

}
