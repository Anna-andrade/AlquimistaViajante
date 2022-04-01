//
//  SKScene+addLabel.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 01/04/22.
//

import Foundation
import SpriteKit
extension SKScene{
    func addLabel(title:String,text:String){
        let backgroundNode = SKSpriteNode()
        backgroundNode.color = .black
        backgroundNode.size = CGSize(width: self.size.width/5, height: self.size.height/4)
        backgroundNode.zPosition = 10
        
        let lblTitle = SKLabelNode()
        #if os(tvOS)
        lblTitle.fontSize = backgroundNode.size.height/5
        #else
        lblTitle.fontSize = backgroundNode.size.height/6
        #endif
        lblTitle.numberOfLines = 0
        lblTitle.fontColor = SKColor.white
        lblTitle.fontName = "munro"
        lblTitle.text = title
        lblTitle.position = CGPoint(x: 0, y:-lblTitle.fontSize/2)
        lblTitle.preferredMaxLayoutWidth = backgroundNode.size.width

        
        let lbl = SKLabelNode()
        #if os(tvOS)
        lbl.fontSize = backgroundNode.size.height/10
        #else
        lbl.fontSize = backgroundNode.size.height/12
        #endif
        lbl.numberOfLines = 0
        lbl.fontColor = SKColor.white
        lbl.fontName = "munro"
        lbl.text = text
        lbl.position = CGPoint(x: 0, y:lblTitle.fontSize/2+backgroundNode.size.height*0.1-backgroundNode.size.height/2)
        lbl.preferredMaxLayoutWidth = backgroundNode.size.width

        backgroundNode.addChild(lbl)
        backgroundNode.addChild(lblTitle)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height-backgroundNode.size.height/2-50)
        addChild(backgroundNode)

    }
}
