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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = SKView()
        let scene = GameSceneBreakChemicalBond()
        scene.scaleMode = .aspectFit
        scene.size = CGSize(width: self.view.frame.width, height: self.view.frame.width)
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsPhysics = true
        self.view = skView
    }

    var shouldAutorotate: Bool {
        return true
    }

//    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }

    var prefersStatusBarHidden: Bool {
        return true
    }
}
