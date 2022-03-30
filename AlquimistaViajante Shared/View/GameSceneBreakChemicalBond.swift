//
//  GameSceneBreakChemicalBond.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneBreakChemicalBond: SKScene{
    
    let GC = GameController.shared
    var beakerNode : BeakerNode?

    override func didMove(to view: SKView) {
        
        let width = self.size.width
        let height = self.size.height
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        tableNode.size = CGSize(width: width, height: height/2)
        tableNode.position = CGPoint(x: tableNode.size.width*0.5, y: tableNode.size.height*0.5)
        addChild(tableNode)
        tableNode.zPosition = 0
        
        beakerNode = BeakerNode( size: CGSize(width: width/2.5, height: width/2.5))
        beakerNode?.position = CGPoint(x: self.size.width/2, y: self.size.height*1.25/2)
        beakerNode?.zPosition = 1
        guard let verBeakerNode = beakerNode else { return }
        addChild(verBeakerNode)
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        bunsenBurnerNode.size = CGSize(width: width*0.25, height: height*0.25)
        bunsenBurnerNode.position = CGPoint(x: bunsenBurnerNode.size.width*2.15625, y: bunsenBurnerNode.size.height*0.875)
        addChild(bunsenBurnerNode)
        bunsenBurnerNode.zPosition = 1
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }
    func assobrar(){
        for product in GC.arrayProduct {
            guard let verBeakerNode = beakerNode else { return }
            product.breakComposto(node: verBeakerNode, location: product.position)
            GC.eraseComponents()
        }
    }
}
