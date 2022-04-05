//
//  String+Localization.swift
//  AlquimistaViajante
//
//  Created by Talita Nunes dos Santos on 24/03/22.
//
import func Foundation.NSLocalizedString

extension String {
        // Nova função:
    func localized() -> String {       // Vai retornar uma string
        return NSLocalizedString(
            self,                      // Pega a própria strig em que a função foi chamada
            tableName: "String+Localization", // Nome do arquivo .string (vai ser criado)
            bundle: .main,
            value: self,               // Caso não tenha um valor á aquela string vai ser usada ela mesmo
            comment: self
        )
    }
}
