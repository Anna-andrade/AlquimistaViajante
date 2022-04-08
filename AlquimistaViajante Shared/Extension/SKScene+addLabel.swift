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
        backgroundNode.color = .brown
        backgroundNode.size = CGSize(width: self.size.width/3, height: self.size.height/6)
        backgroundNode.zPosition = 10
        
        for i in 0...1 {
                let trecoNode = SKSpriteNode(imageNamed: "treco")
            let width = backgroundNode.size.width
            let height = backgroundNode.size.height
            backgroundNode.addChild(trecoNode)
            trecoNode.size = CGSize(width: width*0.09, height: width*0.18)
            trecoNode.position = CGPoint(x: -width*0.3+CGFloat(i)*width/2, y: height*0.6)
           trecoNode.zPosition = 11
            }
        
        let lblTitle = SKLabelNode()
        #if os(tvOS)
        lblTitle.fontSize = backgroundNode.size.width/5
        #else
        lblTitle.fontSize = backgroundNode.size.width/8
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
        lbl.fontSize = backgroundNode.size.width/16
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
        backgroundNode.color = .brown
        backgroundNode.size = CGSize(width: self.size.width*0.5, height: self.size.height*0.35)
//        backgroundNode.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.9)
        backgroundNode.zPosition = 10

        for i in 0...1 {
                let trecoNode = SKSpriteNode(imageNamed: "treco")
            let width = self.size.width
            let height = self.size.height
           self.addChild(trecoNode)
            trecoNode.size = CGSize(width: width*0.02, height: width*0.06)
            trecoNode.position = CGPoint(x: width*0.3+CGFloat(i)*width/3.5, y: height*0.77)
           trecoNode.zPosition = 11
            }
        
        let lbl = SKLabelNode()
        #if os(tvOS)
        lbl.fontSize = backgroundNode.size.width/18
        #else
        lbl.fontSize = backgroundNode.size.width/24
        #endif
        lbl.numberOfLines = 0
        lbl.fontColor = SKColor.white
        lbl.fontName = "munro"
        lbl.text = text
        lbl.position = CGPoint(x: 0, y: lbl.fontSize/2-backgroundNode.size.height/2)
        lbl.preferredMaxLayoutWidth = backgroundNode.size.width-10

        backgroundNode.addChild(lbl)
        backgroundNode.position = CGPoint(x: self.size.width*0.45, y: self.size.height*0.6)
        addChild(backgroundNode)
    }
    
}
