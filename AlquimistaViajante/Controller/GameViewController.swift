//
//  GameViewController.swift
//  AlquimistaViajante
//
//  Created by Anna Carolina Costa Andrade on 14/03/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    let scene = GameSceneReaction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = SKView()
        scene.scaleMode = .aspectFit
        scene.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsPhysics = true
        self.view = skView
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            guard let sceneRect = scene as? GameSceneReaction else { return }
            print("oi")
            sceneRect.shake()
        }
    }
    
}
