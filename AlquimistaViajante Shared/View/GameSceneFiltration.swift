//
//  GameSceneFiltration.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneFiltration: SKScene {
    
    let GC = GameController.shared
    
    var time: Timer?
    var count = 0
        
    override func didMove(to view: SKView) {
        let w = self.size.width
        let h = self.size.height
        
        self.isUserInteractionEnabled = true
        
        let beakerNode = BeakerNode( size: CGSize(width: w*0.3, height: w*0.3))
        addChild(beakerNode)
        beakerNode.texture?.filteringMode = .nearest
        beakerNode.position = CGPoint(x: w*0.5, y: h*0.30)
        beakerNode.zPosition = 2
        
        let filterNode = SKSpriteNode(imageNamed: "filter")
        addChild(filterNode)
        filterNode.texture?.filteringMode = .nearest
        filterNode.scale(to: CGSize(width: w*0.35, height: w*0.7))
        filterNode.position = CGPoint(x: w*0.5, y: h*0.5)
        filterNode.zPosition = 1
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if count>10 && count<15{
            GC.filterComp()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(measureIntensity), userInfo: nil, repeats: true)
    }
    @objc func measureIntensity() {
         count += 1
     }
}
