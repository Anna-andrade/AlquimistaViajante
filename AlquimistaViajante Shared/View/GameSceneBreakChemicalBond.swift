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

    override func didMove(to view: SKView) {
        
        let width = self.size.width
        let height = self.size.height
        
        for product in GC.arrayProduct {
            self.addChild(product)
            product.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            product.zPosition = 5
            product.name = "composto"
        }
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        tableNode.size = CGSize(width: width, height: height/2)
        tableNode.position = CGPoint(x: tableNode.size.width*0.5, y: tableNode.size.height*0.5)
        addChild(tableNode)
        tableNode.zPosition = 0
        
        let beakerNode = BeakerNode( size: CGSize(width: width/2.5, height: width/2.5))
        beakerNode.position = CGPoint(x: self.size.width/2, y: self.size.height*1.25/2)
        addChild(beakerNode)
        beakerNode.zPosition = 1
        
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
            product.breakComposto(scene: self, location: product.position)
            GC.eraseComponents()
        }
    }
}
