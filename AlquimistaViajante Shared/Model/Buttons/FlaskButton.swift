//
//  FlaskNode.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 22/03/22.
//

import Foundation
import SpriteKit

class FlaskButton: SKNode {
    
    weak var delegate: AddProductsDelegate?
    var imgNode: SKSpriteNode
    var size: CGSize
    
    private func border() -> UIBezierPath {
        let w = self.size.width
        let h = self.size.height

        let path = UIBezierPath()
        path.move(to: CGPoint(x: -w/8, y: h/16))
        path.addLine(to: CGPoint(x: -w/8, y: h/4))
        path.addLine(to: CGPoint(x: w/7.5, y: h/4))
        path.addLine(to: CGPoint(x: w/7.5, y: h/16))
        path.addCurve(to: CGPoint(x: w/9, y: -h/2.6), controlPoint1: CGPoint(x: w/3.5, y: h/20), controlPoint2: CGPoint(x: w/3.2, y: -h/2.6))
        path.addLine(to: CGPoint(x: -w/9, y: -h/2.6))
        path.addCurve(to: CGPoint(x: -w/8, y: h/16), controlPoint1: CGPoint(x: -w/3.2, y: -h/2.6), controlPoint2: CGPoint(x: -w/3.5, y: h/20))
        return path
        }
    
    init(imgName: String, size: CGSize) {
        self.size = size
        let texture = SKTexture(imageNamed: imgName)
        texture.filteringMode = .nearest
        self.imgNode = SKSpriteNode(texture: texture, size: size)
        
        super.init()
        
        self.physicsBody?.collisionBitMask  = 1
        physicsBody = SKPhysicsBody(edgeLoopFrom: border().cgPath)
        physicsBody?.isDynamic = false
        let frameShape = SKShapeNode(path: border().cgPath)
        frameShape.zPosition = 4
        frameShape.strokeColor = .clear
        frameShape.name = "frame"
                
        addChild(imgNode)
        addChild(frameShape)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
            
            if let p = (touchedNode as? SKShapeNode)?.path {
                if p.contains(positionInScene) {
                    let location = positionInScene
                    let comp = Product(lados: [3, nil])
                    comp.position = location
                    comp.zPosition = 3
                    addChild(comp)
                    delegate?.addProducts(product: comp)
                }
            }
        }
    }
}
