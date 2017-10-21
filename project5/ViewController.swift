//
//  ViewController.swift
//  project5
//
//  Created by Mac on 2017/10/21.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var amoutBeforeText_Textfield: UITextField!
  @IBOutlet weak var tipPercent: UILabel!
  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalAfterTax: UILabel!
  @IBOutlet weak var taxSlider: UISlider!
  
  var amount: Float = 0.00
  var tip: Float = 0.10
  
  let tipCalculator = Tip()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func taxSliderChanges(_ sender: Any) {
    
  }
  
  func addDoneButton() {
    let barButtonFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let barButtonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(processInputAmount))
    let keyboardToolbar = UIToolbar()
    keyboardToolbar.items = [ barButtonFlex, barButtonDone ]
    keyboardToolbar.sizeToFit()
    amoutBeforeText_Textfield.inputAccessoryView = keyboardToolbar
  }
  
  @objc func processInputAmount() {
    // End editing
    amoutBeforeText_Textfield.endEditing(true)
    
    if let stringAmount = amoutBeforeText_Textfield.text {
      self.amount = (stringAmount as NSString).floatValue
    }
    else {
      self.amount = 0
    }
    
    amoutBeforeText_Textfield.text = String(format: "$%0.2f", self.amount)
    calculateTip()
  }
  
  func calculateTip() {
    let amountTip = self.tipCalculator.calculateTip(amount: self.amount, tip: self.tip)
    let amountTotal = self.tipCalculator.calculateTotal(amount: self.amount, tip: self.tip)
    
    tipPercent.text = String(format: "Tip (%.0f%%):", self.tip * 100)
    tipAmount.text = String(format: "$%0.2f", amountTip)
    totalAfterTax.text = String(format: "$%0.2f", amountTotal)
  }
  
}

