//
//  GameSceneLaboratory.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.

import Foundation
import SpriteKit

class GameSceneLaboratory: SKScene {
    lazy var width = self.size.width
    lazy var height = self.size.height
    lazy var bunsenBurnerButton = SKButtonNavigation(imageName: "bunsenBurner", sceneToGo: GameSceneBreakChemicalBond())
    lazy var glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration())
    lazy var flatBottomFlaskButton = SKButtonNavigation(imageName: "flatBottomFlask", sceneToGo: GameSceneReaction())
    lazy var bookNode = SKButtonNavigation(imageName: "book", sceneToGo: GameSceneBook())
    lazy var mortarNode = MortarButton(size: CGSize(width: width*0.1, height: width*0.1), lados: [3,nil])
    
    var gesture = UITapGestureRecognizer()
    
    override func didMove(to view: SKView) {
        
        setup()
    }
    
    func setup(){
        removeAllChildren()

//        let bookNode = SKSpriteNode(imageNamed: "book")
        self.addChild(bookNode)
        bookNode.size = CGSize(width: width*0.1, height: width*0.1)
        bookNode.position = CGPoint(x: width*0.2, y: height*0.6)
        bookNode.zPosition = 3
        
        let trashNode = SKSpriteNode(imageNamed: "trash")
        self.addChild(trashNode)
        trashNode.size = CGSize(width: width*0.13, height: width*0.13)
        trashNode.position = CGPoint(x: width*0.9, y: height*0.44)
        trashNode.zPosition = 3
        
        let tableNode = SKSpriteNode(imageNamed: "table")
        self.addChild(tableNode)
        tableNode.size = CGSize(width: width*0.8, height: width*0.35)
        tableNode.position = CGPoint(x: width*0.43, y: height*0.3)
        tableNode.zPosition = 1
        
        let beakerNode = BeakerNode(size: CGSize(width: width*0.12, height: width*0.12))
        self.addChild(beakerNode)
        beakerNode.position = CGPoint(x: width*0.6, y: height*0.27)
        beakerNode.zPosition = 2

        let bookcaseNode = SKSpriteNode(imageNamed: "bookcase")
        self.addChild(bookcaseNode)
        bookcaseNode.size = CGSize(width: width*0.12, height: width*0.12)
        bookcaseNode.position = CGPoint(x: width*0.2, y: height*0.5)
        bookcaseNode.zPosition = 2

        let shelfNode = SKSpriteNode(imageNamed: "shelf")
        self.addChild(shelfNode)
        shelfNode.size = CGSize(width: width*0.8, height: width/7.9)
        shelfNode.position = CGPoint(x: width*0.43, y: height*0.7)
        shelfNode.zPosition = 1
        
//        let bunsenBurnerButton = SKButtonNavigation(imageName: "bunsenBurner", sceneToGo: GameSceneBreakChemicalBond())
        bunsenBurnerButton.isUserInteractionEnabled = true
        self.addChild(bunsenBurnerButton)
        bunsenBurnerButton.size = CGSize(width: width*0.11, height: width*0.11)
        bunsenBurnerButton.position = CGPoint(x: width*0.12, y: height*0.85)
        bunsenBurnerButton.zPosition = 2
        
//        let glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration())
        glassFunnelButton.isUserInteractionEnabled = true
        self.addChild(glassFunnelButton)
        glassFunnelButton.size = CGSize(width: width*0.12, height: width*0.12)
        glassFunnelButton.position = CGPoint(x: width*0.3, y: height*0.86)
        glassFunnelButton.zPosition = 2
        
        // let flatBottomFlaskButton = SKButtonNavigation(imageName: "flatBottomFlask", sceneToGo: GameSceneReaction(), imagePress: "flaskPress")
        flatBottomFlaskButton.isUserInteractionEnabled = true
        self.addChild(flatBottomFlaskButton)
        flatBottomFlaskButton.size = CGSize(width: width*0.11, height: width*0.11)
        flatBottomFlaskButton.position = CGPoint(x: width*0.5, y: height*0.84)
        flatBottomFlaskButton.zPosition = 2
        
        let testTubeNode = SKSpriteNode(imageNamed: "testTube")
        self.addChild(testTubeNode)
        testTubeNode.size = CGSize(width: width*0.13, height: width*0.13)
        testTubeNode.position = CGPoint(x: width*0.72, y: height*0.87)
        testTubeNode.zPosition = 2
        
//        let mortarNode = MortarButton(size: CGSize(width: width*0.15, height: height*0.15), lados: [3,nil])
        mortarNode.isUserInteractionEnabled = true
        mortarNode.delegate = self
        self.addChild(mortarNode)
        mortarNode.position = CGPoint(x: width*0.4, y: height*0.25)
        mortarNode.zPosition = 2
        
    
        
//        let glassFunnelButton = SKButtonNavigation(imageName: "glassFunnel", sceneToGo: GameSceneFiltration(), imagePress: "filterPress")
//        glassFunnelButton.isUserInteractionEnabled = true
//        self.addChild(glassFunnelButton)
//        glassFunnelButton.size = CGSize(width: width*0.12, height: width*0.12)
//        glassFunnelButton.position = CGPoint(x: width*0.3, y: height*0.86)
//        glassFunnelButton.zPosition = 2
        
        drawBackgroundFloor(side: 1050)
        addBackButton()
        
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
            removeAllChildren()
            bunsenBurnerButton.changeScene()
        } else if glassFunnelButton.isFocused {
            removeAllChildren()
            glassFunnelButton.changeScene()
        } else if flatBottomFlaskButton.isFocused {
            removeAllChildren()
            flatBottomFlaskButton.changeScene()
        } else if mortarNode.isFocused{
            removeAllChildren()
            mortarNode.addProductScene()
        }else if bookNode.isFocused{
            bookNode.changeScene()
        }
    }
#endif
}

#if os(tvOS)
extension GameSceneLaboratory {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [mortarNode]
    }

}
#endif
extension GameSceneLaboratory:loadSceneDelegate{
    func loadScene() {
        setup()
    }
}

