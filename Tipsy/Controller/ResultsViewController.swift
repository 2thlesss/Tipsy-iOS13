//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Thomas Jadie Reeves on 3/13/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var billAmount: Float = 0.0
    var numberOfPeople: Float = 0.0
    var tipPercentage: Float = 0.0
    var perPersonAmount: Float = 0.0
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "$%.2f", perPersonAmount)
        settingsLabel.text = "Split between \(Int(numberOfPeople)) people with \(Int(tipPercentage * 100))% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)}
}
