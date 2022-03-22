//
//  FlaskNode.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 22/03/22.
//

import Foundation
import SpriteKit

class FlaskNode:SKNode{
    
    weak var delegate:AddProductsDelegate?
    var imgNode:SKSpriteNode
    
    var border: UIBezierPath {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: -75, y:50))
            path.addLine(to: CGPoint(x: -75, y:150))
            path.addLine(to: CGPoint(x: 75, y:150))
            path.addLine(to: CGPoint(x: 75, y:50))
            path.addCurve(to: CGPoint(x: 40, y:-250), controlPoint1: CGPoint(x: 175, y: 30), controlPoint2: CGPoint(x: 200, y: -225))
            path.addLine(to: CGPoint(x: -40, y:-250))
            path.addCurve(to: CGPoint(x: -75, y: 50), controlPoint1: CGPoint(x: -200, y: -225), controlPoint2: CGPoint(x: -175, y: 30))
            return path
        }
    

    
    init(imgName:String, size:CGSize) {
        let texture = SKTexture(imageNamed: imgName)
        texture.filteringMode = .nearest
        self.imgNode = SKSpriteNode(texture: texture, size: size)
        
        super.init()
        
        physicsBody = SKPhysicsBody (edgeLoopFrom: border.cgPath)
        physicsBody?.isDynamic = false
        let frameShape = SKShapeNode(path: border.cgPath)
        frameShape.zPosition = 4
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
            
            if let p = (touchedNode as! SKShapeNode).path {
                if p.contains(positionInScene) {
                    let location = positionInScene
                    let comp = Composto(lados: [3,nil])
                    comp.position = location
                    comp.zPosition = 3
                    addChild(comp)
                }
            }
        }
    }
}
