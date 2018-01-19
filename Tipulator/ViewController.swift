//
//  ViewController.swift
//  Tipulator
//
//  Created by Miguel Ugalde on 12/15/17.
//  Copyright © 2017 Miguel Ugalde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.15, 0.18, 0.20]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
        //this is hard coded, ideally would have formatted for loop to
        // use format scheme to name each segv# where seg could have
        // however many partitions
        defaults.set(tipControl.titleForSegment(at: 0), forKey: "segV0")
        defaults.set(tipControl.titleForSegment(at: 1), forKey: "segV1")
        defaults.set(tipControl.titleForSegment(at: 2), forKey: "segV2")
        
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipDefault = UserDefaults.standard.integer(forKey: "defaultTip")
        
        
        if let tip = UserDefaults.standard.value(forKey: "defaultTip"){
            tipControl.selectedSegmentIndex = tipDefault
        }
        
        tipControl.setTitle(UserDefaults.standard.string(forKey: "segV0"), forSegmentAt: 0)
        tipControl.setTitle(UserDefaults.standard.string(forKey: "segV1"), forSegmentAt: 1)
        tipControl.setTitle(UserDefaults.standard.string(forKey: "segV2"), forSegmentAt: 2)
        
        for i in 0...(tipPercentages.count-1){
            
            print(i)
            
            let title = tipControl.titleForSegment(at: i)
            print(title)
            
            tipPercentages[i] = Double(String(title!.dropLast()))!/100
            print(tipPercentages[tipControl.selectedSegmentIndex])
        }
        
        calculateTip(self)
        
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        //let tipPercentages = [0.15, 0.18, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

