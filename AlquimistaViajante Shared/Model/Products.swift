//
//  Products.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import SpriteKit
import Foundation

class Product: SKSpriteNode {
    
    var reagentes: [Reagente?] = []
    var isDead: Bool = false
    var isReact: Bool = false
    var width = Double(Reagente.sideReagente) * 1.2
    
    public init(lados: [Int?]) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: Reagente.sideReagente, height: Reagente.sideReagente))
        for i in 0...1 {
            if let verLado = lados[i] {
                self.reagentes.append(Reagente(quantVert: verLado))
            } else {
                self.reagentes.append(nil)
            }
        }
        addFormasComposto()
        self.zPosition = 4
        self.name = "product"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addPhysicsBody(size: CGSize) {
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.contactTestBitMask = 1
        self.physicsBody?.collisionBitMask  = 1
        self.physicsBody?.affectedByGravity = false
    }
    
    private func addFormasComposto() {
        removeAllChildren()
        guard let reagente0 = reagentes[0] else {
            print("forma não existe")
            return
        }
        let step: CGFloat = (.pi * 2) / CGFloat(reagente0.quantVert)
        var angle: CGFloat = 0.0
        let raio = Double(Reagente.sideReagente)
        
        for i in 0..<reagentes.count {
            if let reagente = reagentes[i] {
                reagente.position = reagentes[1] == nil ? CGPoint(x: 0, y: 0) : CGPoint(x: -Double(width/2.5), y: 0)
                let initAngle = reagente.quantVert == 4 ? Double.pi/4 : reagente.quantVert == 6 ? Double.pi/6 :0
                reagente.zRotation = initAngle
            
                if i != 0 {
                    reagente.zRotation = Double.pi + angle + initAngle
                    let x = raio * cos(Double(angle))
                    let y = raio * sin(Double(angle))
                    reagente.position = CGPoint(x: x-Double(width/2.5), y: y)
                    angle += step
                
                }
                reagente.zPosition = -1
            addChild(reagente)
            addPhysicsBody(size: CGSize(width: reagentes[1] == nil ? width:1.75*width, height: width))
            }
        }
        
    }
    
    public func altVert(estado: EstadosFormas) {
        for reagente in reagentes {
            if let veriReagente = reagente {
            switch estado {
            case .add:
                veriReagente.addLadosForma()
            case .sub:
                veriReagente.subLadosForma()
                }
            }
        }
        composicao()
        addFormasComposto()
    }
    
    private func composicao() {
        guard let reagente1 = reagentes[1] else {return}
        guard let reagente0 = reagentes[0] else {return}
        if reagente0.quantVert == reagente1.quantVert && (reagente0.quantVert != 6 && reagente1.quantVert != 6) {
            reagentes[1] = nil
            reagentes[0]?.addLadosForma()
        } else {
            self.isReact = true
        }
    }
    public func breakComposto(node: SKNode, location: CGPoint) {
        if reagentes[1] == nil {
            return
        }
        for reagente in reagentes {
            if let vetReagente = reagente {
                let product = Product(lados: [vetReagente.quantVert, nil])
                node.addChild(product)
                GameController.shared.arrayProduct.append(product)
                product.position = location
                product.physicsBody?.applyForce(CGVector(dx: Int.random(in: -500...500), dy: Int.random(in: -500...500)))
            }
        }
        selfDestroy()
    }
    
    public func absorved(product: Product) {
        self.reagentes[1] = product.reagentes[0]
        product.isReact = true
        composicao()
        addFormasComposto()
    }
    
    public func selfDestroy() {
        self.isDead = true
        self.removeAllChildren()
        self.removeFromParent()
    }

}
