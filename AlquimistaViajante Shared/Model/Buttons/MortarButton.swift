//
//  MortarButton.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 28/03/22.
//

import Foundation
import SpriteKit

class MortarButton:SKSpriteNode{
    
    func setup(){
        let mortarNode = SKSpriteNode(imageNamed: "mortar")
        self.addChild(mortarNode)
        mortarNode.size = CGSize(width: self.size.width*0.15, height: self.size.width*0.15)
        mortarNode.position = CGPoint(x: mortarNode.size.width*3.75, y: mortarNode.size.height*1.25)
        mortarNode.zPosition = 2
        
        let mortarBottomNode = SKSpriteNode(imageNamed: "mortarBottom")
        self.addChild(mortarBottomNode)
        mortarBottomNode.size = CGSize(width: self.size.width*0.15, height: self.size.width*0.15)
        mortarBottomNode.position = CGPoint(x: mortarBottomNode.size.width*3.75, y: mortarBottomNode.size.height*1.25)
        mortarBottomNode.zPosition = 2
        
    }
}
