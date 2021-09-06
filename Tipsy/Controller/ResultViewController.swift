//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Tarık Nasuhoğlu on 6.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    var bill: Bill?
    
    @IBOutlet weak var resultLblUI: UILabel!
    @IBOutlet weak var resultDescLblUI: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let billInfo = bill {
            resultLblUI.text = billInfo.getResult()
            resultDescLblUI.text = "Split between \(bill!.personCount) people, with \(bill!.tip)% tip."
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
