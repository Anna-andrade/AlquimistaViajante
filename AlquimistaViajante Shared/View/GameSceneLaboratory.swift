//
//  GameSceneLaboratory.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.

import Foundation
import SpriteKit

class GameSceneLaboratory: SKScene {
    let bunsenBurnerButton = SKButtonNavigation(imageName: "bunsenBurner", sceneToGo: GameSceneBreakChemicalBond())
    let glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration())
    let flatBottomFlaskNode = SKButtonNavigation(imageName: "flatBottomFlask", sceneToGo: GameSceneReaction())
    
    var gesture = UITapGestureRecognizer()
    
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
        
//        let bunsenBurnerButton = SKButtonNavigation(imageName: "bunsenBurner", sceneToGo: GameSceneBreakChemicalBond())
        bunsenBurnerButton.isUserInteractionEnabled = true
        self.addChild(bunsenBurnerButton)
        bunsenBurnerButton.size = CGSize(width: width*0.15, height: height*0.15)
        bunsenBurnerButton.position = CGPoint(x: bunsenBurnerButton.size.width, y: bunsenBurnerButton.size.height*5.25)
        bunsenBurnerButton.zPosition = 2
        
//        let glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration())
        glassFunnelButton.isUserInteractionEnabled = true
        self.addChild(glassFunnelButton)
        glassFunnelButton.size = CGSize(width: width*0.15, height: height*0.15)
        glassFunnelButton.position = CGPoint(x: glassFunnelButton.size.width*2.5, y: glassFunnelButton.size.height*5.25)
        glassFunnelButton.zPosition = 2
        
//        let flatBottomFlaskNode = SKButtonNavigation(imageName: "flatBottomFlask", sceneToGo: GameSceneReaction())
        flatBottomFlaskNode.isUserInteractionEnabled = true
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
        
#if os(tvOS)
        addTapGestureRecognizer()
#endif
    }
#if os(tvOS)
    func addTapGestureRecognizer(){
        gesture.addTarget(self, action: #selector(clicked))
        self.view?.addGestureRecognizer(gesture)
    }
    @objc func clicked(){
        if bunsenBurnerButton.isFocused {
            // acao do bunsen
            
        } else if glassFunnelButton.isFocused {
            // acao do glass
        } else if flatBottomFlaskNode.isFocused {
            // acao flatbottom
        }
    }
#endif
}

#if os(tvOS)
extension GameSceneLaboratory {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [bunsenBurnerButton]
    }
}
#endif
