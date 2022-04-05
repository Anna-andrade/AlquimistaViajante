//
//  SKSpriteNode+focus.swift
//  AlquimistaViajante
//
//  Created by Vitor Cheung on 04/04/22.
//

import Foundation
import SpriteKit
extension SKSpriteNode{
#if os(tvOS)
    open override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator){
        
        if context.previouslyFocusedItem === self{
            self.setScale(self.xScale/1.1)
            self.setScale(self.yScale/1.1)
            self.alpha = 0.5
        }
        
        if context.nextFocusedItem === self{
            self.setScale(self.xScale*1.1)
            self.setScale(self.yScale*1.1)
            self.alpha = 1
        }
    }
#endif
}
