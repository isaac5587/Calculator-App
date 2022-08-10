//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Trill Isaac on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber : Bool = true
    private var calculator = CalculatorLogic()
    
    //getter that converts the display label number into a double
    var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failed to convert double into textLabel")
            }
            return number
        }set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func aCalculatorButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        
        if let calcMethod = sender.currentTitle {
            
            
            if let result = calculator.calculate(calcSymbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func aNumberButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        //Allows for multiple numbers to be displayed in the calculator label
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    //is rounded down display # equal to current display # becomes false the number has a decimal point
                    let isInt = floor(displayValue) == displayValue
                    
                    //If the number is not an integer
                    if !isInt {
                        return // forces to stop appending the decimal point value
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

