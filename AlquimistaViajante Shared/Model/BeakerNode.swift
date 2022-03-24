//
//  BeackerNode.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 23/03/22.
//

import Foundation
import SpriteKit

class BeakerNode:SKSpriteNode{
    
    private func border()-> UIBezierPath {
        let w = self.size.width
        let h = self.size.height
            let path = UIBezierPath()
            path.move(to: CGPoint(x: w/2.75 , y:h/2.35))
            path.addLine(to: CGPoint(x: w/2.75, y:-h/2.7))
            path.addLine(to: CGPoint(x: -w/3, y:-h/2.7))
            path.addLine(to: CGPoint(x: -w/3, y:h/2.35))
            return path
        }
    
    init(imgName:String, size:CGSize) {
        let texture = SKTexture(imageNamed: imgName)
        texture.filteringMode = .nearest
        super.init(texture: texture, color: .clear, size: size)
        physicsBody = SKPhysicsBody (edgeLoopFrom: border().cgPath)
        self.physicsBody?.collisionBitMask  = 1
        physicsBody?.isDynamic = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
