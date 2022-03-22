//
//  Products.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import SpriteKit
import Foundation

class Composto:SKSpriteNode{
    
    var formas: [Forma?] = []
    var isDead: Bool = false
    var isReact: Bool = false
    
    public init(lados:[Int?]){
        super.init(texture: nil, color: UIColor.clear, size:  CGSize(width: 30, height: 30))
        for i in 0...1 {
            if let verLado = lados[i] {
                self.formas.append(Forma(QuantVert: verLado))
            }else{
                self.formas.append(nil)
            }
        }
        addFormasComposto()
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        self.physicsBody?.contactTestBitMask = 1
        self.physicsBody?.collisionBitMask  = 1
        self.name = "composto"
        self.physicsBody?.affectedByGravity = false
//        self.physicsBody?.collisionBitMask = 1 // com quem eu trombo
//        self.physicsBody?.contactTestBitMask = 2 // quais sao as mascara que eu irei notificar
//        self.physicsBody?.categoryBitMask = 2 // Qual minha mascara
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addFormasComposto(){
        removeAllChildren()
        guard let forma0 = formas[0] else {
            print("forma não existe")
            return
        }
        let step: CGFloat = (.pi * 2) / CGFloat(forma0.QuantVert)
        var angle: CGFloat = 0.0
        let raio = 30.0
        
        for i in 0..<formas.count {
            if let forma = formas[i]{
                let initAngle = forma.QuantVert == 4 ? Double.pi/4 : forma.QuantVert == 6 ? Double.pi/6 :0
                forma.zRotation = initAngle
            
                if i != 0 {
                    forma.zRotation = Double.pi + angle + initAngle
                    let x = raio * cos(Double(angle))
                    let y = raio * sin(Double(angle))
                    forma.position = CGPoint(x: x , y: y)
                    angle += step
                
                }
                forma.zPosition = -1
            addChild(forma)
            }
        }
        
    }
    
    public func altVert(estado:EstadosFormas){
        for forma in formas {
            if let veriForma = forma{
            switch estado {
                case .add:
                    veriForma.addLadosForma()
                case .sub:
                    veriForma.subLadosForma()
                }
            }
            
        }
        
        composicao()
        addFormasComposto()
    }
    
    private func composicao(){
        guard let forma1 = formas[1] else{return}
        guard let forma0 = formas[0] else{return}
        if forma0.QuantVert == forma1.QuantVert && (forma0.QuantVert != 6 && forma1.QuantVert != 6){
            formas[1] = nil
            formas[0]?.addLadosForma()
        }
        else{
            self.isReact = true
        }
        
    }
    
    func breakComposto(scene:SKScene, location:CGPoint){
        if formas[1] == nil{
            return
        }
        for forma in formas {
            if let vetForma = forma{
                let comp = Composto(lados: [vetForma.QuantVert,nil])
                scene.addChild(comp)
                comp.isReact = true
                comp.position = location
                comp.physicsBody?.applyImpulse(CGVector(dx: Int.random(in: -500...500), dy: Int.random(in: -500...500)))
            }
        }
        selfDestroy()
    }
    
    func absorved(composto:Composto){
        self.formas[1] = composto.formas[0]
        composto.isReact = true
        composicao()
        addFormasComposto()
    }
    
    func selfDestroy(){
        self.isDead = true
        self.removeAllChildren()
        self.removeFromParent()
    }
    
}

