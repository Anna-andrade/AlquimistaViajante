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
    weak var delegateTexture: ChangeTextureButtonDelegate?
    var imagePress: String = ""
    weak var changeDelegate: (ChangeSceneDelegate)? = GameController.shared.changeDelegate
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
        
        #if os(tvOS)
        self.alpha = 0.75
        #endif
        
    }
    init(imageName: String, sceneToGo: SKScene, imagePress: String){
        self.imagePress = imagePress
        self.sceneToGo = sceneToGo
        self.imageName = imageName
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: CGSize())
        self.isUserInteractionEnabled = true
        self.focusBehavior = .focusable
        #if os(tvOS)
            self.alpha = 0.75
        #endif
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        if imagePress != "" {
            let texture = SKTexture(imageNamed: imagePress)
             self.texture = texture
             delegateTexture?.changeTextureButton(button: self)
        }
    }
    
#if os(iOS)
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeScene()
    }
#endif
    func changeScene(){
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
