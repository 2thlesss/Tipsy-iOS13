//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Thomas Jadie Reeves on 3/13/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct TipsyBrain {
    let billAmount : Float
    let tipPercentage : Float
    let numberOfPeople : Float
    
    init(billAmount: Float, tipPercentage: Float, numberOfPeople: Float) {
        self.billAmount = billAmount
        self.tipPercentage = tipPercentage
        self.numberOfPeople = numberOfPeople
    }
    func calculateTip()-> Float {
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        let perPersonAmount = totalAmount   /   numberOfPeople
        return perPersonAmount
    }
}
