//
//  ViewController.swift
//  Calculator
//
//  Created by Rehan Sajid on 20/09/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

       
        
        @IBOutlet weak var display: UILabel!

        @IBAction func touchDigit(sender: UIButton) {
                let digit = sender.currentTitle!
                
                let textCurrentlyInDisplay = display.text!
                
                display.text = textCurrentlyInDisplay + digit
                
                
                
        }

}

