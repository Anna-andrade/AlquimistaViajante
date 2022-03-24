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
        lbl.fontSize = 26
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.text = "Introducao".localized()
        return lbl
    }()
    
    lazy var BlockTwo: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontName = "munro"
        lbl.fontColor = SKColor.black
        lbl.fontSize = 22
        lbl.text = "Paragrafo1".localized()
        lbl.numberOfLines = 0

        return lbl
    }()
    
    lazy var BlockThree: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.fontSize = 22
        lbl.text = "Paragrafo2".localized()
        lbl.numberOfLines = 0
        lbl.preferredMaxLayoutWidth = size.width

        return lbl
    }()
    
    lazy var BlockFour: SKLabelNode = {
        var lbl = SKLabelNode()
        lbl.fontColor = SKColor.black
        lbl.fontName = "munro"
        lbl.fontSize = 22
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
        BlockOne.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.9)
        BlockOne.preferredMaxLayoutWidth = self.size.width/2.5
        BlockTwo.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.65)
        BlockTwo.preferredMaxLayoutWidth = self.size.width/2.5
        BlockThree.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.45)
        BlockThree.preferredMaxLayoutWidth = self.size.width/2.5
        BlockFour.position = CGPoint(x: self.size.width/4, y: self.size.height * 0.15)
        BlockFour.preferredMaxLayoutWidth = self.size.width/2.5
    }
    
}
