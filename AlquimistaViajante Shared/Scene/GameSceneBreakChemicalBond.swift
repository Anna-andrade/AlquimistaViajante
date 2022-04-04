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
        
//        let tableNode = SKSpriteNode(imageNamed: "table")
//        tableNode.size = CGSize(width: width, height: width*0.45)
//        tableNode.position = CGPoint(x: width*0.5, y: height*0.4)
//        addChild(tableNode)
//        tableNode.zPosition = 0
//        
        beakerNode = BeakerNode(size: CGSize(width: width*0.3, height: width*0.3))
        beakerNode?.position = CGPoint(x: width*0.492, y: height*0.55)
        beakerNode?.zPosition = 1
        guard let verBeakerNode = beakerNode else { return }
        addChild(verBeakerNode)
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        bunsenBurnerNode.size = CGSize(width: width*0.15, height: width*0.15)
        bunsenBurnerNode.position = CGPoint(x: width*0.5, y: height*0.15)
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
