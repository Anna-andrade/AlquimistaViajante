//
//  Reagents.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import SpriteKit
import Foundation

class Forma:SKSpriteNode{
    
    var QuantVert: Int
    
    public init(QuantVert:Int){
        self.QuantVert = QuantVert
        super.init(texture: nil, color: UIColor.clear, size:  CGSize(width: 60, height: 60))
        self.name = "forma"
        nameTexture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func subLadosForma(){
        if QuantVert>3{
            QuantVert -= 1
            nameTexture()
        }
    }
    
    public func addLadosForma(){
        if QuantVert<6{
            QuantVert += 1
            nameTexture()
        }
    }
    
    private func nameTexture(){
        
        var nomeForma: String
        
        switch QuantVert{
            case 3:
                nomeForma = "triangulo"
            case 4:
                nomeForma = "quadrado"
//                self.zRotation =  Double.pi/4
            case 5:
                nomeForma = "pentagono"
            case 6:
                nomeForma =  "hexagono"
//                self.zRotation =  Double.pi/6
            default:
                nomeForma = "circulo"
        }
        
        self.texture = SKTexture(imageNamed: nomeForma)
    }
    
}
