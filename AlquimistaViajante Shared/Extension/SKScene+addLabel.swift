//
//  SKScene+addLabel.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 07/04/22.
//

import Foundation
import SpriteKit
extension SKScene {
    func addLabelMini(title: String, text: String) {
        let backgroundNode = SKSpriteNode()
        backgroundNode.color = .black
        backgroundNode.size = CGSize(width: self.size.width/3, height: self.size.height/6)
        backgroundNode.zPosition = 10
        
        let lblTitle = SKLabelNode()
        #if os(tvOS)
        lblTitle.fontSize = backgroundNode.size.width/5
        #else
        lblTitle.fontSize = backgroundNode.size.width/6
        #endif
        lblTitle.numberOfLines = 0
        lblTitle.fontColor = SKColor.white
        lblTitle.fontName = "munro"
        lblTitle.text = title
        lblTitle.position = CGPoint(x: 0, y: -lblTitle.fontSize/2+backgroundNode.size.width/20)
        lblTitle.preferredMaxLayoutWidth = backgroundNode.size.width

        let lbl = SKLabelNode()
        #if os(tvOS)
        lbl.fontSize = backgroundNode.size.width/10
        #else
        lbl.fontSize = backgroundNode.size.width/12
        #endif
        lbl.numberOfLines = 0
        lbl.fontColor = SKColor.white
        lbl.fontName = "munro"
        lbl.text = text
        lbl.position = CGPoint(x: 0, y: lbl.fontSize/2+backgroundNode.size.height*0.1-backgroundNode.size.height/2)
        lbl.preferredMaxLayoutWidth = backgroundNode.size.width

        backgroundNode.addChild(lbl)
        backgroundNode.addChild(lblTitle)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height-backgroundNode.size.height/2-50)
        addChild(backgroundNode)

    }
    
    func addLabelLab( text: String) {
        let backgroundNode = SKSpriteNode()
        backgroundNode.color = .black
        backgroundNode.size = CGSize(width: self.size.width/2.5, height: self.size.height/5)
        backgroundNode.zPosition = 10

        let lbl = SKLabelNode()
        #if os(tvOS)
        lbl.fontSize = backgroundNode.size.width/18
        #else
        lbl.fontSize = backgroundNode.size.width/22
        #endif
        lbl.numberOfLines = 0
        lbl.fontColor = SKColor.white
        lbl.fontName = "munro"
        lbl.text = text
        lbl.position = CGPoint(x: 0, y: lbl.fontSize/2-backgroundNode.size.height/3)
        lbl.preferredMaxLayoutWidth = backgroundNode.size.width-10

        backgroundNode.addChild(lbl)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height/1.75)
        addChild(backgroundNode)
    }
    
}
