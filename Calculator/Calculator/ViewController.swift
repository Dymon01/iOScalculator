//
//  ViewController.swift
//  Calculator
//
//  Created by Дмитрий Анатольевич Плямко on 01/05/2019.
//  Copyright © 2019 Дмитрий Анатольевич Плямко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber:Double? = nil
    var secondNumber:Double? = nil
    var resultNumber:Double? = nil
    var operation:String = ""
    var clearDisplay = false

    @IBOutlet weak var additionDisplay: UILabel!
    @IBOutlet weak var Display: UILabel!
    
    @IBAction func Number(_ sender: UIButton) {
         if (clearDisplay == true){
            Display.text =  sender.currentTitle!
            clearDisplay = false
         } else {
           Display.text = Display.text! +  sender.currentTitle!
        }
        if (firstNumber != nil ) {
            secondNumber = Double(Display.text!)!
            calculation()
        }

    }
    @IBAction func Operations(_ sender: UIButton) {
        if (Display.text != "" &&
            Display.text != "+" &&
            Display.text != "-" &&
            Display.text != "*" &&
            Display.text != "/" &&
            sender.currentTitle! != "=" &&
            resultNumber == nil) {
            firstNumber = Double(Display.text!)!
            
        }
        if (Display.text != "" &&
            Display.text != "+" &&
            Display.text != "-" &&
            Display.text != "*" &&
            Display.text != "/" &&
            operation != "" &&
            sender.currentTitle! != "=" &&
            resultNumber != nil &&
            sender.currentTitle! != "C") {
            firstNumber = resultNumber

        }

        if (Display.text != "" &&
            sender.currentTitle! != "=" &&
            sender.currentTitle! != "C") {
            operation = sender.currentTitle!

            dispayOperation()
            additionDisplay.text = dispayNumberFin(dispayNumber: String(firstNumber!)) + " " + Display.text!
            operation = Display.text!
            clearDisplay = true
            

        
        } else if (sender.currentTitle! == "=" &&
            operation != "" &&
            Display.text != "" &&
            Display.text != "+" &&
            Display.text != "-" &&
            Display.text != "*" &&
            Display.text != "/") {
            if (resultNumber == nil) {
                secondNumber = Double(Display.text!)!            }
            calculation()
            dispayResult()
            clearDisplay = true
            firstNumber = resultNumber

        } else if (sender.currentTitle! == "C") {
            Display.text = ""
            operation = ""
            firstNumber = nil
            resultNumber = nil
            secondNumber = nil
            additionDisplay.text = ""
        } else if (firstNumber != nil &&
            operation != "" &&
            Display.text != "+" &&
            Display.text != "-" &&
            Display.text != "*" &&
            Display.text != "/" &&
            sender.currentTitle! != "=") {
            firstNumber = resultNumber!
            calculation()
            dispayResult()

            clearDisplay = true
        }
       
    }
    func calculation() -> Double {
        
        if (operation == "+") {
            resultNumber = firstNumber! + secondNumber!
        }
        if (operation == "-") {
            resultNumber = firstNumber! - secondNumber!
        }
        if (operation == "*") {
            resultNumber = firstNumber! * secondNumber!
        }
        if (operation == "/") {
            resultNumber = firstNumber! / secondNumber!
        } else if (secondNumber! == 0){
            resultNumber = 0
        }

        return resultNumber!
    }
    
     func dispayResult() {
        Display.text = dispayNumberFin(dispayNumber: String(resultNumber!))
        additionDisplay.text = dispayNumberFin(dispayNumber: String(firstNumber!)) + " " + operation + " " + dispayNumberFin(dispayNumber: String(secondNumber!)) + " ="
    }
    
    func dispayNumberFin(dispayNumber: String) -> String {
        var numberFinDisplay:String = ""
        var dispayNumberFin = String(dispayNumber).components(separatedBy: ".")
        if (Int(dispayNumberFin[1])! == 0){
            numberFinDisplay = dispayNumberFin[0]
        } else {
            numberFinDisplay = dispayNumber
        }
            return numberFinDisplay
    }
    
    func dispayOperation() {
    if (operation == "+"){
    Display.text = "+"
    } else if (operation == "-"){
    Display.text = "-"
    } else if (operation == "*"){
    Display.text = "*"
    } else if (operation == "/"){
    Display.text = "/"
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

}

