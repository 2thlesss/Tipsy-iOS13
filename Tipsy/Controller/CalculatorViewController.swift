//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var billAmount: Float = 0.0
       var numberOfPeople: Float = 0.0
       var tipPercentage: Float = 0.0
       var perPersonAmount: Float = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var split = 2
  
    var tip = 0.10
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleNoPercent = String(buttonTitle.dropLast())
        
        let buttonTitleNumber = Double(buttonTitleNoPercent)
        
        
        
        tip = (buttonTitleNumber ?? 0.0)
        
        
        
        billTextField.endEditing(true)
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.stepValue = 1
        sender.maximumValue = 20
        sender.minimumValue = 2
        splitNumberLabel.text = String (sender.value)
        split = Int(sender.value)
        
    }
    
    
    @IBAction func calcuclatePressed(_ sender: UIButton) {
        
        if let billAmount = Float(billTextField.text ?? ""),
            let numberOfPeople = Float(splitNumberLabel.text ?? "") {
            let tipCalculator = TipsyBrain(billAmount: billAmount, tipPercentage: Float(tip) / 100, numberOfPeople: numberOfPeople)
            perPersonAmount = tipCalculator.calculateTip()
            self.numberOfPeople = numberOfPeople
            self.tipPercentage = Float(tip)
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResults" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.billAmount = billAmount
                destinationVC.perPersonAmount = perPersonAmount
                destinationVC.numberOfPeople = numberOfPeople
                destinationVC.tipPercentage = tipPercentage
            }
        }
    }
    




