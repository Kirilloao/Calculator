//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kirill Taraturin on 12.10.2023.
//

import Foundation

struct CalculatorLogic {
    
    // MARK: - Private Properties
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    // MARK: - Mutating Methods
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let newNumber = number {
            switch symbol {
            case "+/-":
                return newNumber * -1
            case "AC":
                return 0
            case "%":
                return newNumber * 0.01
            case "=":
                return performTwoNumCalculation(n2: newNumber)
            default:
                intermediateCalculation = (n1: newNumber, calcMethod: symbol)
            }
        }
        return nil
    }
    
    // MARK: - Private Methods
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+" :
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
