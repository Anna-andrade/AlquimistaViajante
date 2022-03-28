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
        
        let width = self.size.width
        let height = self.size.height
        
        let bookNode = SKSpriteNode(imageNamed: "book")
        self.addChild(bookNode)
        bookNode.size = CGSize(width: width*0.15, height: height*0.15)
        bookNode.position = CGPoint(x: bookNode.size.width*3.75, y: bookNode.size.height*3)
        bookNode.zPosition = 3
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        self.addChild(tableNode)
        tableNode.size = CGSize(width: width, height: height/2)
        tableNode.position = CGPoint(x: tableNode.size.width*0.5, y: tableNode.size.height*0.5)
        
        let beakerNode = SKSpriteNode(imageNamed: "beaker")
        self.addChild(beakerNode)
        beakerNode.size = CGSize(width: width*0.25, height: height*0.25)
        beakerNode.position = CGPoint(x: beakerNode.size.width*3.5, y: beakerNode.size.height*0.8)
        beakerNode.zPosition = 2
        
        let bookcaseNode = SKSpriteNode(imageNamed: "bookcase")
        self.addChild(bookcaseNode)
        bookcaseNode.size = CGSize(width: width*0.2, height: height*0.15)
        bookcaseNode.position = CGPoint(x: bookNode.size.width*3.75, y: bookNode.size.height*2.5)
        bookcaseNode.zPosition = 2
        
        let shelfNode = SKSpriteNode(imageNamed: "shelf")
        self.addChild(shelfNode)
        shelfNode.size = CGSize(width: width, height: height/2)
        shelfNode.position = CGPoint(x: tableNode.size.width*0.5, y: tableNode.size.height*1.25)
        
        let bunsenBurnerNode = SKSpriteNode(imageNamed: "bunsenBurner")
        self.addChild(bunsenBurnerNode)
        bunsenBurnerNode.size = CGSize(width: width*0.15, height: height*0.15)
        bunsenBurnerNode.position = CGPoint(x: bunsenBurnerNode.size.width, y: bunsenBurnerNode.size.height*5.25)
        bunsenBurnerNode.zPosition = 2
        
        let glassFunnelNode = SKSpriteNode(imageNamed: "glassFunnel")
        self.addChild(glassFunnelNode)
        glassFunnelNode.size = CGSize(width: width*0.15, height: height*0.15)
        glassFunnelNode.position = CGPoint(x: glassFunnelNode.size.width*2.5, y: glassFunnelNode.size.height*5.25)
        glassFunnelNode.zPosition = 2
        
        let flatBottomFlaskNode = SKSpriteNode(imageNamed: "flatBottomFlask")
        self.addChild(flatBottomFlaskNode)
        flatBottomFlaskNode.size = CGSize(width: width*0.15, height: height*0.15)
        flatBottomFlaskNode.position = CGPoint(x: flatBottomFlaskNode.size.width*4.5, y: flatBottomFlaskNode.size.height*5.25)
        flatBottomFlaskNode.zPosition = 2
        
        let testTubeNode = SKSpriteNode(imageNamed: "testTube")
        self.addChild(testTubeNode)
        testTubeNode.size = CGSize(width: width*0.15, height: height*0.15)
        testTubeNode.position = CGPoint(x: testTubeNode.size.width*6, y: testTubeNode.size.height*5.25)
        testTubeNode.zPosition = 2
        
        let mortarNode = SKSpriteNode(imageNamed: "mortar")
        self.addChild(mortarNode)
        mortarNode.size = CGSize(width: width*0.15, height: height*0.15)
        mortarNode.position = CGPoint(x: mortarNode.size.width*3.75, y: mortarNode.size.height*1.25)
        mortarNode.zPosition = 2
        
        let mortarBottomNode = SKSpriteNode(imageNamed: "mortarBottom")
        self.addChild(mortarBottomNode)
        mortarBottomNode.size = CGSize(width: width*0.15, height: height*0.15)
        mortarBottomNode.position = CGPoint(x: mortarBottomNode.size.width*3.75, y: mortarBottomNode.size.height*1.25)
        mortarBottomNode.zPosition = 2
        
        drawBackgroundFloor(side: 1050)
    }
}
