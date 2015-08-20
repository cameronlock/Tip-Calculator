//
//  ViewController.swift
//  Tips
//
//  Created by Cameron Lock on 8/16/15.
//  Copyright (c) 2015 Cameron Lock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var twosplitLabel: UILabel!
    
    @IBOutlet weak var threesplitLabel: UILabel!
    
    @IBOutlet weak var foursplitLabel: UILabel!
    
    @IBOutlet weak var fivesplitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        var twosplit = total / 2
        var threesplit = total / 3
        var foursplit = total / 4
        var fivesplit = total / 5
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        

        tipLabel.text = updateTipValue(tip)
        totalLabel.text = String(format: "$%.2f", total)

        
        twosplitLabel.text = String(format: "$%.2f", twosplit)
        threesplitLabel.text = String(format: "$%.2f", threesplit)
        foursplitLabel.text = String(format: "$%.2f", foursplit)
        fivesplitLabel.text = String(format: "$%.2f", fivesplit)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing (true)
    }


    
    
    func updateTipValue(tip: Double) -> String {
        
        UIView.animateWithDuration(0.1 ,
            animations: {
                self.tipLabel.transform = CGAffineTransformMakeScale(1.3, 1.3)
            },
            
            completion: { finish in
                UIView.animateWithDuration(0.1){
                    self.tipLabel.transform = CGAffineTransformIdentity
                }
        })
        
        
        return String(format: "$%.2f", tip)
    }

}

