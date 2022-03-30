//
//  Button.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class SKButtonNavigation: SKSpriteNode{
    
    var imageName: String
    var sceneToGo: SKScene
    weak var changeDelegate: (ChangeSceneDelegate)? = GameController.shared.changeDelegate
    var touchStart: CGPoint?
    var isFocusable: Bool = true
    
    var canBecomeFocusable: Bool{
        return isFocusable
    }
    
    init(imageName: String, sceneToGo: SKScene){
        self.sceneToGo = sceneToGo
        self.imageName = imageName
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: CGSize())
        self.isUserInteractionEnabled = true
        self.focusBehavior = .focusable
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeDelegate?.changeScene(scene: sceneToGo)
    }
#if os(tvOS)
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator){
        
        if context.previouslyFocusedItem === self{
            self.setScale(self.xScale/1.1)
            self.setScale(self.yScale/1.1)
            self.alpha = 0.5
        }
        
        if context.nextFocusedItem === self{
            self.setScale(self.xScale*1.1)
            self.setScale(self.yScale*1.1)
            self.alpha = 1
        }
    }
#endif
}
