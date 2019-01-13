//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Case Wright on 1/9/19.
//  Copyright © 2019 Case Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var currencySignLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let local = NSLocale.current
        let symbol = local.currencySymbol
        
        currencySignLabel.text = symbol
    }
    
    override func viewDidAppear(_ animated: Bool) {
        inputField.becomeFirstResponder()
    }
    
    @IBAction func inputChanged(_ sender: Any) {
        changeValue()
    }
    
    func changeValue() -> Void {
        let value = inputField.text?.prefix(1) == " " ? Double(inputField.text!.dropFirst())  :  Double(inputField.text!)
        var tip: Double = 0
        switch(tipAmount.selectedSegmentIndex) {
        case 0:
            tip = 1.18
            break
        case 1:
            tip = 1.2
            break
        case 2:
            tip = 1.25
        default:
            tip = 1.18
        }
        let result = (value ?? 0) * tip
        resultLabel.text = "$" + String(format: "%.2f", result)
    }
    
}

