//
//  GameSceneBook.swift
//  AlquimistaViajante
//
//  Created by Talita Nunes dos Santos on 23/03/22.
//

import Foundation
import SpriteKit

class GameSceneBook: SKScene {

    lazy var BlockOne: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.numberOfLines = 0
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.text = "Introducao".localized()
        return lbl
    }()
    
    lazy var BlockTwo: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontName = "munro"
        lbl.fontColor = SKColor.black
        lbl.text = "Paragrafo1".localized()
        lbl.numberOfLines = 0

        return lbl
    }()
    
    lazy var BlockThree: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.text = "Paragrafo2".localized()
        lbl.numberOfLines = 0
        lbl.preferredMaxLayoutWidth = size.width

        return lbl
    }()
    
    lazy var BlockFour: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.text = "Paragrafo3".localized()
        lbl.numberOfLines = 0
        lbl.preferredMaxLayoutWidth = size.width

        return lbl
    }()
    
    override func didMove(to view: SKView) {
        addChild(BlockOne)
        addChild(BlockTwo)
        addChild(BlockThree)
        addChild(BlockFour)
        drawBackgroundBook(side: self.size.width)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        BlockOne.preferredMaxLayoutWidth = self.size.width/2.5
        #if os(tvOS)
        BlockOne.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.84)
        BlockOne.fontSize = self.size.height/30
        #else
        BlockOne.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.7)
        BlockOne.fontSize = self.size.height/35
        #endif
        
        BlockTwo.preferredMaxLayoutWidth = self.size.width/2.5
        #if os(tvOS)
        BlockTwo.position = CGPoint(x: self.size.width/4, y: BlockOne.frame.height * 3.5)
        BlockTwo.fontSize = self.size.height/30
        #else
        BlockTwo.position = CGPoint(x: self.size.width/4, y: BlockOne.frame.height * 3.0)
        BlockTwo.fontSize = self.size.height/40
        #endif
        
        BlockThree.preferredMaxLayoutWidth = self.size.width/2.5
        #if os(tvOS)
        BlockThree.position = CGPoint(x: self.size.width/1.32, y: self.size.height * 0.74)
        BlockThree.fontSize = self.size.height/30
        #else
        BlockThree.position = CGPoint(x: self.size.width/1.32, y: self.size.height * 0.78)
        BlockThree.fontSize = self.size.height/40
        #endif
        
        BlockFour.preferredMaxLayoutWidth = self.size.width/2.5
        #if os(tvOS)
        BlockFour.position = CGPoint(x: self.size.width/1.32, y: BlockThree.frame.height * 0.68)
        BlockFour.fontSize = self.size.height/30
        #else
        BlockFour.position = CGPoint(x: self.size.width/1.32, y: BlockThree.frame.height * 1.5)
        BlockFour.fontSize = self.size.height/40
        #endif
        
    }
    
}
