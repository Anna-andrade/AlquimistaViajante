//
//  SKButton.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 29/03/22.
//

//import Foundation
//import SpriteKit
//
//class SKButton: SKSpriteNode {
//    var touchStart: CGPoint?
//    var isFocusable: Bool = true
//    
//    var canBecomeFocusable: Bool{
//        return isFocusable
//    }
//    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator){
//        
//        if context.previouslyFocusedItem === self{
//            self.setScale(self.xScale/1.1)
//            self.setScale(self.yScale/1.1)
//            self.alpha = 0.50
//        }
//        
//        if context.nextFocusedItem === self{
//            self.setScale(self.xScale*1.1)
//            self.setScale(self.yScale*1.1)
//            self.alpha = 1
//        }
//    }
//}
