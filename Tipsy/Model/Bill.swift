//
//  Bill.swift
//  Tipsy
//
//  Created by Tarık Nasuhoğlu on 6.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Bill {
    var amount: Double = 0
    var tip: Int = 10
    var personCount: Int = 2
    
    func getResult() -> String{
        let result = ((amount / 100.0 * Double(tip)) + amount) / Double(personCount)
        return String(format: "%.2f", result)
    }
}
