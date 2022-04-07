//
//  MortarButton.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 28/03/22.
//

import Foundation
import SpriteKit

class MortarButton: SKSpriteNode {
    weak var delegate: loadSceneDelegate?
    let GC = GameController.shared
    let lados: [Int?]
    var isFocusable: Bool = true
    
    var canBecomeFocusable: Bool {
        return isFocusable
    }
    
    init(size: CGSize, lados: [Int?]) {
        self.lados = lados
        super.init(texture: nil, color: .clear, size: size)
        self.focusBehavior = .focusable
        setup()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        removeAllChildren()
        let mortarNode = SKSpriteNode(imageNamed: "mortar")
        self.addChild(mortarNode)
        mortarNode.size = CGSize(width: size.height, height: size.width)
        mortarNode.zPosition = 4
        
        let imgProduct = Product(lados: lados)
        addChild(imgProduct)
        imgProduct.zPosition = 3
        imgProduct.position = CGPoint(x: 0, y: 30)
        imgProduct.reagentes[0]?.size = CGSize(width: size.height/1.5, height: size.height/1.5)
        imgProduct.size = CGSize(width: size.height/1.5, height: size.height/1.5)
        
        let mortarBottomNode = SKSpriteNode(imageNamed: "mortarBottom")
        self.addChild(mortarBottomNode)
        mortarBottomNode.size = CGSize(width: size.height, height: size.width)
        mortarBottomNode.zPosition = 1
    }
#if os(iOS)
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        addProductScene()
    }
#endif
    func addProductScene() {
        GC.arrayProduct.append(Product(lados: lados))
        if !GC.didTutorial[0] {
            GC.tutotialCompleted(indexTutorial: 0)
        }
        delegate?.loadScene()
    }
}
