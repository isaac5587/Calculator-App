//
//  CalculatorLogic.swift
//  CalculatorApp
//
//  Created by Trill Isaac on 8/9/22.
//

import Foundation

struct CalculatorLogic {
    
    private var calcNumber : Double?
    
    mutating func setNumber (_ number: Double){
        calcNumber = number
    }
    
    private var intermediateCalculation : (num1: Double, calculationMethod: String)?
    
    mutating func calculate(calcSymbol: String) -> Double? {
        
        if let n = calcNumber {
            if calcSymbol == "+/-" {
                return n * -1
            } else if calcSymbol == "AC" {
                return 0
            }else if calcSymbol == "%" {
                return n * 0.01
            }else if calcSymbol == "=" {
                return performTwoNumCalc(num2: n)
            }else{
                intermediateCalculation = (num1: n, calculationMethod: calcSymbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalc(num2: Double) -> Double? {
        if let num1 = intermediateCalculation?.num1,
           let operation = intermediateCalculation?.calculationMethod {
            
            switch operation {
            case "+" :
                return num1 + num2
            case "-" :
                return num1 - num2
            case "x" :
                return num1 * num2
            case "÷" :
                return num1 / num2
            default:
                fatalError("Operation was not found")
            }
        }
        return nil
    }
}
