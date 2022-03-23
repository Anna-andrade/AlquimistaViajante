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
        beakerNode.size = CGSize(width: width/2, height: height/2)
        beakerNode.position = CGPoint(x: beakerNode.size.width, y: beakerNode.size.height)
        addChild(beakerNode)
        beakerNode.zPosition = 1
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        bunsenBurnerNode.size = CGSize(width: width*0.25, height: height*0.25)
        bunsenBurnerNode.position = CGPoint(x: bunsenBurnerNode.size.width*2.15625, y: bunsenBurnerNode.size.height*0.875)
        addChild(bunsenBurnerNode)
        bunsenBurnerNode.zPosition = 1
        
        drawBackgroundWall(side: 1050)
    }
}
