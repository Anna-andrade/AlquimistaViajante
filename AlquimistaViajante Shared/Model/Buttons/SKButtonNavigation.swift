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
    weak var delegate: NavigationDelegate?
    
    init(imageName: String, sceneToGo: SKScene){
        self.sceneToGo = sceneToGo
        self.imageName = imageName
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: CGSize())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.navigationAction(scene: sceneToGo)
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        delegate?.navigationAction(scene: sceneToGo)
    }
    
}
