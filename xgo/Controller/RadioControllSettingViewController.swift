//
//  RadioControllSettingViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit

class RadioControllSettingViewController: UIViewController {
    
    @IBOutlet weak var modleLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var rangeValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func settingAction(serder: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func modelAction(serder: UISwitch) {
        print(serder.isOn)
    }
    
    @IBAction func speedAction(serder: UISegmentedControl) {
        print(serder.selectedSegmentIndex)
    }
    
    @IBAction func heightAction(serder: UISlider) {
        print(serder.value)
        heightValue.text = "\(Int(serder.value))"
    }
    
    @IBAction func rangeAction(serder: UISlider) {
        print(serder.value)
        rangeValue.text = "\(Int(serder.value))"
    }
    
    @IBAction func heightRestAction(serder: UIButton) {
        
    }
    
    @IBAction func rangeRestAction(serder: UIButton) {
        
    }
    
}
