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
                "π"  : Operation.constant(M_PI),
                "e"  : Operation.constant(M_E),
                "√"  : Operation.unaryFunction(sqrt),
                "cos": Operation.unaryFunction(cos),
                "sin": Operation.unaryFunction(sin),
                "+"  : Operation.binaryFunction({$0 + $1}),
                "−"  : Operation.binaryFunction({$0 - $1}),
                "×"  : Operation.binaryFunction({$0 * $1}),
                "÷"  : Operation.binaryFunction({$0 / $1}),
                "="  : Operation.equals
                
                
        ]
        
        private
        enum Operation {
                case constant(Double)
                case unaryFunction((Double) -> Double)
                case binaryFunction((Double, Double) -> Double)
                case equals
        }
        func performOperation(_ symbol: String) {
                
                if let operation = operations[symbol] {
                        switch operation {
                        case .constant (let value):
                                accumulator = value
                        case .unaryFunction (let function):
                                accumulator = function(accumulator)
                        case .binaryFunction(let function):
                               executeBinaryOperation()
                                pending = PendingBinaryFunctionInfo(binaryFunction: function, firstOperand: accumulator)
                        case .equals:
                                executeBinaryOperation()
               
                        }
                }
                
                
        }
        
        private func executeBinaryOperation() {
                if pending != nil {
                        accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                        pending = nil
                        
                }
                
        }
        
        private var pending: PendingBinaryFunctionInfo?
        
        private struct PendingBinaryFunctionInfo {
                var binaryFunction: (Double, Double) -> Double
                var firstOperand: Double
                
        }
        
        var result: Double {
                return accumulator
        }
        
        
}
