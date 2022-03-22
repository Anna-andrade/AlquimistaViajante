//
//  GameSceneBreakChemicalBond.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneBreakChemicalBond: SKScene{
    override func didMove(to view: SKView) {
        
        let width = self.size.width
        let height = self.size.height
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        tableNode.size = CGSize(width: width, height: height/2)
        tableNode.position = CGPoint(x: tableNode.size.width*0.5, y: tableNode.size.height*0.5)
        addChild(tableNode)
        tableNode.zPosition = 0
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        beakerNode.size = CGSize(width: 250, height:250)
        beakerNode.position = CGPoint(x: width/4, y: height/3)
        addChild(beakerNode)
        beakerNode.zPosition = 1
    }
}
