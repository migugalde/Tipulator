//
//  SettingsViewController.swift
//  Tipulator
//
//  Created by Miguel Ugalde on 1/14/18.
//  Copyright © 2018 Miguel Ugalde. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipField: UITextField!
    
    
    @IBOutlet weak var settingsTipControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tipDefault = UserDefaults.standard.integer(forKey: "defaultTip")
        
        //print("HELLLO")
        //print(tipDefault)
        
        if let tip = UserDefaults.standard.value(forKey: "defaultTip") {
            settingsTipControl.selectedSegmentIndex = tipDefault
        }
        
        settingsTipControl.setTitle(UserDefaults.standard.string(forKey: "segV0"), forSegmentAt: 0)
        settingsTipControl.setTitle(UserDefaults.standard.string(forKey: "segV1"), forSegmentAt: 1)
        settingsTipControl.setTitle(UserDefaults.standard.string(forKey: "segV2"), forSegmentAt: 2)
    }
    
    @IBAction func tipDefaultChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        
        defaults.set(settingsTipControl.selectedSegmentIndex, forKey: "defaultTip")
        
        defaults.synchronize()
    }
    
    @IBAction func tipValueChanged(_ sender: Any) {
        let textInp = tipField.text
        let selectedSeg = settingsTipControl.selectedSegmentIndex
        let defaults = UserDefaults.standard

        settingsTipControl.setTitle(textInp! + "%", forSegmentAt: selectedSeg)
        
        defaults.set(settingsTipControl.titleForSegment(at: selectedSeg), forKey: "segV" + String(selectedSeg))
        
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
