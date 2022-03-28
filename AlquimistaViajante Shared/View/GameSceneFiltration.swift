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
        
        self.isUserInteractionEnabled = true
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        addChild(beakerNode)
        beakerNode.texture?.filteringMode = .nearest
        beakerNode.size = CGSize(width: w*0.5, height: h*0.5)
        beakerNode.position = CGPoint(x: w*0.48, y: h*0.19)
        beakerNode.zPosition = 2
        
        let filterNode = SKSpriteNode(imageNamed: "filter")
        addChild(filterNode)
        filterNode.texture?.filteringMode = .nearest
        filterNode.scale(to: CGSize(width: w*0.5, height: h*0.75))
        filterNode.position = CGPoint(x: w*0.5, y: h*0.42)
        filterNode.zPosition = 1
        
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }
}
