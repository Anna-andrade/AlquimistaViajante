//
//  GameSceneFiltration.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit


class GameSceneFiltration: SKScene {
    override func didMove(to view: SKView) {
        let w = self.size.width
        let h = self.size.height
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        addChild(beakerNode)
        beakerNode.size = CGSize(width: w, height: h)
        beakerNode.position = CGPoint(x: beakerNode.size.width*0.5, y: beakerNode.size.height*0.4)
        beakerNode.zPosition = 2
        
        let filterNode = SKSpriteNode(imageNamed: "filter")
        addChild(filterNode)
        filterNode.texture?.filteringMode = .nearest
        filterNode.scale(to: CGSize(width: 500, height: 1000))
        filterNode.position = CGPoint(x: filterNode.size.width*0.5, y: filterNode.size.height*0.5)
        filterNode.zPosition = 1
        
        
        drawBackgroundWall(side: 1050)
        
    }
}
