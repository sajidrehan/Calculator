
//
//  ViewController.swift
//  Calculator
//
//  Created by Rehan Sajid on 20/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

       
        
        //implicit unwrapping
        @IBOutlet private weak var display: UILabel!
        
        private var userIsInTheMiddleOfTyping = false
        

        @IBAction private func touchDigit(_ sender: UIButton) {
                let digit = sender.currentTitle!
       
                if userIsInTheMiddleOfTyping {
                        //unwrapping the optional and assigning its associated value to the constant
                        let textCurrentlyInDisplay = display.text!
                        display.text = textCurrentlyInDisplay + digit
                }else {
                        display.text = digit
                }
                userIsInTheMiddleOfTyping = true //user will always be in the middle of typing at this point
  
                
        }
        
        private var displayValue: Double {
                get{
                        return Double(display.text!)!
                }
                set {
                        display.text = String(newValue)
                        
                        
                }
        }
        
        private let brain = CalculatorBrain()
        
        @IBAction private func performOperation(_ sender: UIButton) {
                
                
                if userIsInTheMiddleOfTyping {
                        brain.setOperand(operand: displayValue)
                        userIsInTheMiddleOfTyping = false
                }
                
                if let mathematicalSymbol = sender.currentTitle { //using optional binding to prevent app from crashing
                        
                        
                        brain.performOperation(mathematicalSymbol)
                        
                        
                }
                
                displayValue = brain.result
                
        }





}

