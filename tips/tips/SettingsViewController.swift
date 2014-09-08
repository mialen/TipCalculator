//
//  SettingsViewController.swift
//  tips
//
//  Created by Alena Nikitina on 9/3/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var settingsTipField: UITextField!
    
    override func viewWillAppear(animated:  Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var pctAmount = defaults.integerForKey("pctAmount")
        var numPeople = defaults.integerForKey("numPeople")
        settingsTipField.text = String(format: "%d", pctAmount)
        peopleStepper.value = Double(numPeople)
        peopleLabel.text = String(format: "%d", numPeople)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func onTapSettings(sender: AnyObject) {
        var pctAmount = NSString(string: settingsTipField.text).integerValue
        if (pctAmount >= 0 && pctAmount <= 100){
            settingsTipField.textColor = UIColor.blackColor()
            view.endEditing(true)
        } else {
            settingsTipField.textColor = UIColor.redColor()
        }
    }
    
    @IBAction func onStepperIncrement(sender: AnyObject) {
        peopleLabel.text = String(format: "%d", Int(peopleStepper.value))
    }
    
    @IBAction func saveSettings(sender: AnyObject) {
        var pctAmount = NSString(string: settingsTipField.text).integerValue
        var numPeople = Int(peopleStepper.value)
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(pctAmount, forKey: "pctAmount")
        defaults.setInteger(numPeople, forKey: "numPeople")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
