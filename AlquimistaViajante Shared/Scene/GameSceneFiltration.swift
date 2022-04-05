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
    var cliked = false
    
    lazy var backButton = addBackButton()
    let filterNode = SKSpriteNode(imageNamed: "openFilter13")
    
    var gesture = UITapGestureRecognizer()
    
    lazy var w = self.size.width
    lazy var h = self.size.height
    
    lazy var pointerNode: SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "pointer")
//        node.texture?.filteringMode = .nearest
        node.scale(to: CGSize(width: w*0.07, height: w*0.07))
        node.zRotation = Double.pi/2
        node.anchorPoint = CGPoint(x: 0.5, y: 0)
        node.position = CGPoint(x: w*0.8525, y: h*0.8-w*0.2/2-node.size.height/4)
        node.zPosition = 2
        return node
    }()
    lazy var barometerNode: SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "barometer")
//        node.texture?.filteringMode = .nearest
        node.scale(to: CGSize(width: w*0.2, height: w*0.2))
        node.position = CGPoint(x: w*0.85, y: h*0.8-node.size.height/2)
        node.zPosition = 1
        return node
    }()
    
    var beakerNode: BeakerNode?
    
    override func didMove(to view: SKView) {
        
        self.isUserInteractionEnabled = true
        
        addChild(filterNode)
//        filterNode.texture?.filteringMode = .nearest
        filterNode.size = CGSize(width: w*0.25, height: w*0.45)
        filterNode.position = CGPoint(x: w*0.5, y: h*0.437)
        filterNode.isUserInteractionEnabled = true
        filterNode.focusBehavior = .focusable
        filterNode.zPosition = 1
        #if os(iOS)
        addChild(barometerNode)
        addChild(pointerNode)
        backButton = addBackButton()
        #endif
        createdBeaker()
        #if os(tvOS)
        beakerNode?.alpha = 0.75
        addTapGestureRecognizer()
        #endif
        drawBackgroundWall(side: 1050)
    }

    func createdBeaker() {
        beakerNode?.removeFromParent()
        beakerNode?.removeAllChildren()
        beakerNode = BeakerNode( size: CGSize(width: w*0.2, height: w*0.2))
//        beakerNode?.texture?.filteringMode = .nearest
        beakerNode?.position = CGPoint(x: w*0.499, y: h*0.2)
        beakerNode?.zPosition = 2
        if let verBeakerNode = beakerNode {
            addChild(verBeakerNode)
        }
    }
    #if os(iOS)
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        time?.invalidate()
        if count>10 && count<=15 {
            GC.filterComp()
        } else if count<10 {
            GC.filterComp()
            for i in (GC.arrayProduct.count*count/10..<GC.arrayProduct.count).reversed() {
                GC.arrayProduct.remove(at: i)
            }
        }
        createdBeaker()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if cliked != false {
            return
        }
        cliked=true
        time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(measureIntensity), userInfo: nil, repeats: true)
        criarGota()
    }
    @objc func measureIntensity() {
        pointerNode.removeFromParent()
        count += 1
        criarGota()
        if count < 20 {
            pointerNode.zRotation -= Double.pi/20
        }
        addChild(pointerNode)
     }
    #endif
    
    func criarGota() {
        let waterNode = SKSpriteNode(imageNamed: "water")
        waterNode.position = CGPoint(x: w*0.5, y: h*0.6)
        waterNode.scale(to: CGSize(width: w/15, height: w/15))
        addChild(waterNode)
        waterNode.run(SKAction.moveTo(y: h*0.2, duration: 1.5), completion: waterNode.removeFromParent)
    }
    
#if os(tvOS)
    func addTapGestureRecognizer() {
        gesture.addTarget(self, action: #selector(clicked))
        self.view?.addGestureRecognizer(gesture)
    }
    @objc func clicked() {

        if backButton.isFocused == true {
            backButton.changeScene()
        } else if filterNode.isFocused == true {
            GC.filterComp()
            
            let waterNode = SKSpriteNode(imageNamed: "water")
            waterNode.position = CGPoint(x: w*0.5, y: h*0.8)
            waterNode.scale(to: CGSize(width: w/10, height: w/10))
            addChild(waterNode)
            waterNode.run(SKAction.moveTo(y: h*0.2, duration: 1.5), completion: waterNode.removeFromParent)
            createdBeaker()
        }
    }
#endif
}

#if os(tvOS)
extension GameSceneFiltration {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [backButton]
    }
}
#endif
