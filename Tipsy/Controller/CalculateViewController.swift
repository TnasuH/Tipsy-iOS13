//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bill: Bill = Bill()
    
    @IBOutlet weak var billTotalTextUI: UITextField!
    @IBOutlet weak var zeroPercentBtnUI: UIButton!
    @IBOutlet weak var tenPercentBtnUI: UIButton!
    @IBOutlet weak var twentyPercentBtnUI: UIButton!
    @IBOutlet weak var personNumberLblUI: UILabel!
    @IBOutlet weak var personNumberStepperUI: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectTipPressed(_ sender: UIButton) {
        zeroPercentBtnUI.isSelected = false
        tenPercentBtnUI.isSelected = false
        twentyPercentBtnUI.isSelected = false
        sender.isSelected = true
        billTotalTextUI.endEditing(true)
        switch sender.currentTitle {
        case zeroPercentBtnUI.currentTitle:
            bill.tip = 0
        case tenPercentBtnUI.currentTitle:
            bill.tip = 10
        case twentyPercentBtnUI.currentTitle:
            bill.tip = 20
        default:
            print("Error while setting tip")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        bill.personCount = Int(sender.value)
        personNumberLblUI.text = "\(bill.personCount)"
        billTotalTextUI.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var errorMsg = ""
        if billTotalTextUI.text!.isEmpty {
            errorMsg += "Please enter an bill amount"
            
            let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        bill.amount = Double(billTotalTextUI.text!)!
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.bill = bill
        }
    }
    
}

