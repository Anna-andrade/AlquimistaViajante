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
    
    lazy var w = self.size.width
    lazy var h = self.size.height
    
    lazy var pointerNode:SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "pointer")
        node.texture?.filteringMode = .nearest
        node.scale(to: CGSize(width: w*0.08, height: w*0.08))
        node.zRotation = Double.pi/2
        node.anchorPoint = CGPoint(x: 0.5, y: 0)
        node.position = CGPoint(x: w*0.8525, y: h*0.9-w*0.2/2-node.size.height/4)
        node.zPosition = 2
        return node
    }()
    
    lazy var barometerNode : SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "barometer")
        node.texture?.filteringMode = .nearest
        node.scale(to: CGSize(width: w*0.2, height: w*0.2))
        node.position = CGPoint(x: w*0.85, y: h*0.9-node.size.height/2)
        node.zPosition = 1
        return node
    }()
    
    var beakerNode:BeakerNode?
    
    override func didMove(to view: SKView) {
        
        self.isUserInteractionEnabled = true
        
        let filterNode = SKSpriteNode(imageNamed: "filter")
        addChild(filterNode)
        filterNode.texture?.filteringMode = .nearest
        filterNode.scale(to: CGSize(width: w*0.35, height: w*0.7))
        filterNode.position = CGPoint(x: w*0.5, y: h*0.5)
        filterNode.zPosition = 1
        addChild(barometerNode)
        addChild(pointerNode)
        createdBeaker()
        
        drawBackgroundWall(side: 1050)
        addBackButton()
    }

    func createdBeaker(){
        beakerNode?.removeFromParent()
        beakerNode?.removeAllChildren()
        beakerNode = BeakerNode( size: CGSize(width: w*0.3, height: w*0.3))
        beakerNode?.texture?.filteringMode = .nearest
        beakerNode?.position = CGPoint(x: w*0.5, y: h*0.25)
        beakerNode?.zPosition = 2
        if let verBeakerNode = beakerNode {
            addChild(beakerNode!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        time?.invalidate()
        if count>10 && count<=15 {
            GC.filterComp()
        } else if count<10 {
            GC.filterComp()
            for i in (GC.arrayProduct.count*count/10..<GC.arrayProduct.count).reversed(){
                GC.arrayProduct.remove(at: i)
            }
        }
        
        createdBeaker()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if cliked != false{
            return
        }
        cliked=true
        time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(measureIntensity), userInfo: nil, repeats: true)
        let waterNode = SKSpriteNode(imageNamed: "water")
        waterNode.position = CGPoint(x: w*0.49, y: h*0.8)
        waterNode.scale(to: CGSize(width: w/10, height: w/10))
        addChild(waterNode)
        waterNode.run(SKAction.moveTo(y: h*0.2, duration: 1.5), completion: waterNode.removeFromParent)
    }
    @objc func measureIntensity() {
        let waterNode = SKSpriteNode(imageNamed: "water")
        waterNode.position = CGPoint(x: w*0.49, y: h*0.8)
        waterNode.scale(to: CGSize(width: w/10, height: w/10))
        addChild(waterNode)
        waterNode.run(SKAction.moveTo(y: h*0.2, duration: 1.5), completion: waterNode.removeFromParent)
        
        pointerNode.removeFromParent()
        count += 1
        print(count)
        if count < 20{
            pointerNode.zRotation -= Double.pi/20
        }
        addChild(pointerNode)
     }
}
