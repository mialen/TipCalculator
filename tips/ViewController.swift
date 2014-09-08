//
//  ViewController.swift
//  tips
//
//  Created by Alena Nikitina on 9/2/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewWillAppear(animated:  Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var pctAmount = defaults.integerForKey("pctAmount")
        var numPeople = defaults.integerForKey("numPeople")
        
        percentLabel.text = String(format: "%d%%", pctAmount)
        percentageSlider.value = Float(pctAmount)
        tipControl.selectedSegmentIndex = numPeople - 1
        onEditingChanged(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = Int(percentageSlider.value)
        var billAmount = NSString(string: billField.text).doubleValue / Double(tipControl.selectedSegmentIndex + 1)
        var tip = billAmount * Double(tipPercentage) / 100.00
        var total = billAmount + tip
        
        if (billAmount > 0){
            billField.textColor = UIColor.blackColor()
        }
        billField.textColor = UIColor.blackColor()
        percentLabel.text = String(format: "%d%%", tipPercentage)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        if (billAmount > 0){
            view.endEditing(true)
        } else {
            billField.textColor = UIColor.redColor()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

