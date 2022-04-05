//
//  FlaskButtons.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 28/03/22.
//
import Foundation
import SpriteKit

class FlaskButton: SKNode {
    
    var isFocusable: Bool = true
    
    var canBecomeFocusable: Bool {
        return isFocusable
    }
    
    var imgNode: SKSpriteNode
    var size: CGSize
    
    private func border() -> UIBezierPath {
        let w = self.size.width
        let h = self.size.height

        let path = UIBezierPath()
        path.move(to: CGPoint(x: -w/8, y: h/7.5))
        path.addLine(to: CGPoint(x: -w/8, y: h/2.8))
        path.addLine(to: CGPoint(x: w/6.2, y: h/2.8))
        path.addLine(to: CGPoint(x: w/6.2, y: h/7.5))
        path.addCurve(to: CGPoint(x: w/9, y: -h/2.6), controlPoint1: CGPoint(x: w/2.5, y: h/20), controlPoint2: CGPoint(x: w/3.2, y: -h/2.6))
        path.addLine(to: CGPoint(x: -w/9, y: -h/2.6))
        path.addCurve(to: CGPoint(x: -w/8, y: h/7.5), controlPoint1: CGPoint(x: -w/3.2, y: -h/2.6), controlPoint2: CGPoint(x: -w/2.5, y: h/20))
        return path
        }
    
    init(imgName: String, size: CGSize) {
        self.size = size
        let texture = SKTexture(imageNamed: imgName)
        texture.filteringMode = .nearest
        self.imgNode = SKSpriteNode(texture: texture, size: size)
        
        super.init()
        
        self.physicsBody?.contactTestBitMask = 1
        self.physicsBody?.collisionBitMask  = 1
        physicsBody = SKPhysicsBody(edgeLoopFrom: border().cgPath)
        physicsBody?.isDynamic = false
        
        let range = Int(size.width/8)
        let ajusteAltura = Int(size.height/10)
        for product in GameController.shared.arrayProduct {
            product.position = CGPoint(x: Int.random(in: -range ... range), y: Int.random(in: -range-ajusteAltura ... range-ajusteAltura))
            product.physicsBody?.contactTestBitMask = 1
            product.physicsBody?.collisionBitMask  = 1
            self.addChild(product)
        }
        addChild(imgNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
#if os(tvOS)
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if context.previouslyFocusedItem === self {
            self.setScale(self.xScale/1.1)
            self.setScale(self.yScale/1.1)
            self.alpha = 0.5
        }
        
        if context.nextFocusedItem === self {
            self.setScale(self.xScale*1.1)
            self.setScale(self.yScale*1.1)
            self.alpha = 1
        }
        
    }
#endif
}
