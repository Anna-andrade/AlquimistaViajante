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
        
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        beakerNode.size = CGSize(width: width*0.7, height: height*0.7)
        beakerNode.position = CGPoint(x: beakerNode.size.width*0.64, y: beakerNode.size.height*0.8)
        addChild(beakerNode)
        beakerNode.zPosition = 1
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        bunsenBurnerNode.size = CGSize(width: width*0.25, height: height*0.25)
        bunsenBurnerNode.position = CGPoint(x: bunsenBurnerNode.size.width*2, y: bunsenBurnerNode.size.height*0.875)
        addChild(bunsenBurnerNode)
        bunsenBurnerNode.zPosition = 1
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }
}
