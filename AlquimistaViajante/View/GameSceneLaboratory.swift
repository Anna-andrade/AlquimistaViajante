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
        
        let bookNode = SKSpriteNode(imageNamed: "book")
        self.addChild(bookNode)
        bookNode.size = CGSize(width: 150.0, height: 150.0)
        bookNode.position = CGPoint(x: 600, y: 480)
        bookNode.zPosition = 3
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        self.addChild(tableNode)
        tableNode.size = CGSize(width: 1045, height: 440)
        tableNode.position = CGPoint(x: 550, y: 200)
        bookNode.zPosition = 4
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        self.addChild(beakerNode)
        beakerNode.size = CGSize(width: 225, height: 225)
        beakerNode.position = CGPoint(x: 900, y: 175)
        beakerNode.zPosition = 5
        
        let bookcaseNode = SKSpriteNode(imageNamed: "bookcase")
        self.addChild(bookcaseNode)
        bookcaseNode.size = CGSize(width: 255, height: 225)
        bookcaseNode.position = CGPoint(x: 550, y: 400)
        bookcaseNode.zPosition = 2
        
        let shelfNode = SKSpriteNode(imageNamed: "shelf")
        self.addChild(shelfNode)
        shelfNode.size = CGSize(width: 950, height: 150)
        shelfNode.position = CGPoint(x: 550, y: 600)
        shelfNode.zPosition = 1
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        self.addChild(bunsenBurnerNode)
        bunsenBurnerNode.size = CGSize(width: 150, height: 150)
        bunsenBurnerNode.position = CGPoint(x: 250, y: 720)
        
        let glassFunnelNode = SKSpriteNode(imageNamed: "glassFunnel")
        self.addChild(glassFunnelNode)
        glassFunnelNode.size = CGSize(width: 150, height: 150)
        glassFunnelNode.position = CGPoint(x: 460, y: 720)
        
        let flatBottomFlaskNode = SKSpriteNode(imageNamed: "flask")
        self.addChild(flatBottomFlaskNode)
        flatBottomFlaskNode.size = CGSize(width: 150, height: 150)
        flatBottomFlaskNode.position = CGPoint(x: 650, y: 720)
        
        let testTubeNode = SKSpriteNode(imageNamed: "testTube")
        self.addChild(testTubeNode)
        testTubeNode.size = CGSize(width: 150, height: 150)
        testTubeNode.position = CGPoint(x: 850, y: 720)
        
        let mortarNode = SKSpriteNode(imageNamed: "mortar")
        self.addChild(mortarNode)
        mortarNode.size = CGSize(width: 120, height: 120)
        mortarNode.position = CGPoint(x: 460, y: 170)
        mortarNode.zPosition = 5
        
        let mortarBottomNode = SKSpriteNode(imageNamed: "mortarBottom")
        self.addChild(mortarBottomNode)
        mortarBottomNode.size = CGSize(width: 120, height: 120)
        mortarBottomNode.position = CGPoint(x: 460, y: 170)
        mortarBottomNode.zPosition = 5
        
        drawBackgroundWall(side: 500)
    }
}
