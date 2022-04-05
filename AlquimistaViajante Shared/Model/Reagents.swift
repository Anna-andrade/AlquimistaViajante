//
//  Reagents.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import SpriteKit
import Foundation

class Reagente: SKSpriteNode {
    
    var quantVert: Int
    #if os(iOS)
    static let sideReagente = 25
    #else
    static let sideReagente = 40
    #endif
    
    public init(quantVert: Int) {
        self.quantVert = quantVert
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: Reagente.sideReagente, height: Reagente.sideReagente))
        self.name = "forma"
        nameTexture()
    }
    
    public init(quantVert: Int, size: CGSize) {
        self.quantVert = quantVert
        super.init(texture: nil, color: UIColor.clear, size: size)
        self.name = "forma"
        nameTexture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func subLadosForma() {
        if quantVert>3 {
            quantVert -= 1
            nameTexture()
        }
    }
    
    public func addLadosForma() {
        if quantVert<6 {
            quantVert += 1
            nameTexture()
        }
    }
    
    private func nameTexture() {
        
        var nomeForma: String
        
        switch quantVert {
        case 3:
            nomeForma = "triangulo"
        case 4:
            nomeForma = "quadrado"
        case 5:
            nomeForma = "pentagono"
        case 6:
            nomeForma =  "hexagono"
        default:
            nomeForma = "circulo"
        }
        self.texture = SKTexture(imageNamed: nomeForma)
    }
}
