//
//  GameSceneLaboratory.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.

// Tentando o commit

import Foundation
import SpriteKit

class GameSceneLaboratory: SKScene {
    
    override func didMove(to view: SKView) {
        
        setup()
    }
    
    func setup(){
        removeAllChildren()
        
        let width = self.size.width
        let height = self.size.height
        
        let bookNode = SKSpriteNode(imageNamed: "book")
        self.addChild(bookNode)
        bookNode.size = CGSize(width: width*0.15, height: width*0.15)
        bookNode.position = CGPoint(x: bookNode.size.width*3.45, y: height*0.6)
        bookNode.zPosition = 3
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        self.addChild(tableNode)
        tableNode.size = CGSize(width: width*0.9, height: width*0.45)
        tableNode.position = CGPoint(x: width*0.5, y: height*0.29)
        tableNode.zPosition = 1
        
        let beakerNode = BeakerNode(size: CGSize(width: width*0.18, height: width*0.18))
        self.addChild(beakerNode)
        beakerNode.position = CGPoint(x: beakerNode.size.width*2.3, y: height*0.27)
        beakerNode.zPosition = 2
        
        let bookcaseNode = SKSpriteNode(imageNamed: "bookcase")
        self.addChild(bookcaseNode)
        bookcaseNode.size = CGSize(width: width*0.15, height: width*0.15)
        bookcaseNode.position = CGPoint(x: bookNode.size.width*3.45, y: height*0.5)
        bookcaseNode.zPosition = 2
        
        let shelfNode = SKSpriteNode(imageNamed: "shelf")
        self.addChild(shelfNode)
        shelfNode.size = CGSize(width: width, height: width/3)
        shelfNode.position = CGPoint(x: shelfNode.size.width*0.5, y: height*0.68)
        shelfNode.zPosition = 1
        
        let bunsenBurnerButton = SKButtonNavigation(imageName: "bunsenBurner", sceneToGo: GameSceneBreakChemicalBond(), imagePress: "bunsenPress")
        bunsenBurnerButton.isUserInteractionEnabled = true
        self.addChild(bunsenBurnerButton)
        bunsenBurnerButton.size = CGSize(width: width*0.15, height: width*0.15)
        bunsenBurnerButton.position = CGPoint(x: bunsenBurnerButton.size.width*1, y: height*0.85)
        bunsenBurnerButton.zPosition = 2
        
        let glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration(), imagePress: "filterPress")
        glassFunnelButton.isUserInteractionEnabled = true
        self.addChild(glassFunnelButton)
        glassFunnelButton.size = CGSize(width: width*0.15, height: width*0.15)
        glassFunnelButton.position = CGPoint(x: glassFunnelButton.size.width*2.5, y: height*0.86)
        glassFunnelButton.zPosition = 2
        
        let flatBottomFlaskButton = SKButtonNavigation(imageName: "flatBottomFlask", sceneToGo: GameSceneReaction(), imagePress: "flaskPress")
        flatBottomFlaskButton.isUserInteractionEnabled = true
        self.addChild(flatBottomFlaskButton)
        flatBottomFlaskButton.size = CGSize(width: width*0.15, height: width*0.15)
        flatBottomFlaskButton.position = CGPoint(x: flatBottomFlaskButton.size.width*4, y: height*0.85)
        flatBottomFlaskButton.zPosition = 2
        
        let testTubeNode = SKSpriteNode(imageNamed: "testTube")
        self.addChild(testTubeNode)
        testTubeNode.size = CGSize(width: width*0.15, height: width*0.15)
        testTubeNode.position = CGPoint(x: testTubeNode.size.width*5.5, y: height*0.86)
        testTubeNode.zPosition = 2
        
        let mortarNode = MortarButton(size: CGSize(width: width*0.15, height: width*0.15), lados: [3,nil])
        position = CGPoint(x: mortarNode.size.width*1.4, y: height*0.22)
        mortarNode.isUserInteractionEnabled = true
        mortarNode.delegate = self
        self.addChild(mortarNode)
        mortarNode.position = CGPoint(x: mortarNode.size.width*1.4, y: height*0.224)
        mortarNode.zPosition = 2
        
        drawBackgroundFloor(side: 1050)
    }

}

extension GameSceneLaboratory:loadSceneDelegate{
    func loadScene() {
        setup()
    }
}
