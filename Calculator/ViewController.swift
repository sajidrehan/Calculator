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
        @IBOutlet weak var display: UILabel!
        
        var userIsInTheMiddleOfTyping = false
        

        @IBAction func touchDigit(sender: UIButton) {
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
        
        
        @IBAction func performOperation(sender: UIButton) {
                
                userIsInTheMiddleOfTyping = false
                if let mathematicalSymbol = sender.currentTitle { //using optional binding to prevent app from crashing
                        if mathematicalSymbol == "π" {
                                display.text = String(M_PI)
                                
                        }
                        
                }
                
        }

}

