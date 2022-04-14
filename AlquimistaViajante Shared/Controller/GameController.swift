//
//  GameController.swift
//  AlquimistaViajante
//
//  Created by Marcus Vinicius Silva de Sousa on 14/03/22.
//

import Foundation

class GameController {
    static var shared = GameController()
    var changeDelegate: ChangeSceneDelegate?
    var points = 0
    var arrayProduct: [Product] = []
    var didTutorial: [Bool] = [false, false, false, false, false, false]
    
    private init() {
        if let array = UserDefaults.standard.value(forKey: "tutorial9") as? [Bool] {
            didTutorial = array
        }
    }
    
    func eraseComponents() {
        for i in 0..<arrayProduct.count {
            if arrayProduct[i].isDead {
                arrayProduct.remove(at: i)
                break
            }
        }
    }

    func filterComp() {
        var arrayFilter: [Product] = []
        var moreSides = 0
        for product in arrayProduct {
            if product.reagentes[1] == nil {
                if product.reagentes[0]?.quantVert ?? 0>moreSides {
                    arrayFilter = []
                    moreSides = product.reagentes[0]?.quantVert ?? 0
                    arrayFilter.append(product)
                } else if product.reagentes[0]?.quantVert ?? 0 == moreSides {
                    arrayFilter.append(product)
                }
            }
        }
        arrayProduct = arrayFilter
    }
    
    func removeProductFromScream() {
        for product in arrayProduct {
            product.removeFromParent()
        }
    }
    
    func tutotialCompleted(indexTutorial:Int) {
        didTutorial[indexTutorial] = true
        UserDefaults.standard.set(didTutorial, forKey: "tutorial9")
    }
    
    
}
