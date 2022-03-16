//
//  GameSceneLaboratory.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation
import SpriteKit

class GameSceneLaboratory: SKScene {
    override func didMove(to view: SKView) {
        let bookNode = SKSpriteNode(imageNamed: "Book")
        self.addChild(bookNode)
        bookNode.size = CGSize(width: 152.0, height: 152.0)
        bookNode.position = CGPoint(x: 165.45, y: 473.56)
    }
}
