//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Rehan Sajid on 21/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import Foundation

class CalculatorBrain {
        
        private var accumulator = 0.0
        
        func setOperand(operand: Double) {
                accumulator = operand
        }
        
        private var operations: Dictionary<String, Operation> = [
                "π" : Operation.constant(M_PI),//M_PI,
                "√" : Operation.unaryFunction(sqrt), //sqrt()
                "cos": Operation.unaryFunction(cos)
                
        ]
        
        private
        enum Operation {
                case constant(Double)
                case unaryFunction((Double) -> Double)
        }
        func performOperation(_ symbol: String) {
                
                if let operation = operations[symbol] {
                        switch operation {
                        case .constant (let value): accumulator = value
                        case .unaryFunction (let function):
                                accumulator = function(accumulator)
               
                        }
                }
                
                
        }
        
        var result: Double {
                return accumulator
        }
        
        
}
