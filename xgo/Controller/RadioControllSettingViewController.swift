//
//  RadioControllSettingViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit

class RadioControllSettingViewController: BaseViewController {
    
    @IBOutlet weak var modleLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var rangeValue: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var setpSlider: UISlider!
    @IBOutlet weak var modelSwitch: UISwitch!
    @IBOutlet weak var bView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        heightSlider.value = 60
        setpSlider.value = 60
        heightValue.text = "60"
        rangeValue.text = "60"
        
        modleLabel.text = "自稳模式".localized
        speedLabel.text = "整机速度".localized
        heightLabel.text = "整机高度".localized
        rangeLabel.text = "步      幅".localized
        segmentedControl.setTitle("低速".localized, forSegmentAt: 0)
        segmentedControl.setTitle("普通".localized, forSegmentAt: 1)
        segmentedControl.setTitle("高速".localized, forSegmentAt: 2)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
        bView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bViewClick)))
        
        modelSwitch.isOn = ROBOT_balance
        
        segmentedControl.selectedSegmentIndex = Int(ROBOT_speed)
        
        heightValue.text = "\(ROBOT_height)"
        heightSlider.value = Float(ROBOT_height)
        
        rangeValue.text = "\(ROBOT_stepLength)"
        setpSlider.value = Float(ROBOT_stepLength)
        
    }
    
    @objc func closeView() {
        self.dismiss(animated: false)
    }
    
    @objc func bViewClick() {
        
    }
    
    @IBAction func settingAction(serder: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func modelAction(serder: UISwitch) {
        print(serder.isOn)
        RobotFunction.autoBalance(enable: serder.isOn)
//        saveKeyToValue(key: "ModelKey", value: serder.isOn)
        ROBOT_balance = serder.isOn
    }
    
    @IBAction func speedAction(serder: UISegmentedControl) {
        print(serder.selectedSegmentIndex)
        switch serder.selectedSegmentIndex {
            case 0:
                RobotFunction.setSpeed(speed: 1)
            case 1:
                RobotFunction.setSpeed(speed: 2)
            case 2:
                RobotFunction.setSpeed(speed: 3)
            default:
                RobotFunction.setSpeed(speed:3)
        }
//        saveKeyToValue(key: "SpeedKey", value: serder.selectedSegmentIndex + 1)
        ROBOT_speed = Int8(serder.selectedSegmentIndex)
    }
    
    @IBAction func heightAction(serder: UISlider) {
        print(Int(serder.value))
        heightValue.text = "\(Int(serder.value))"
        RobotFunction.heightControl(height: 75 + Int(serder.value) * 2 / 5)
//        saveKeyToValue(key: "HeightKey", value: Int(serder.value))
        ROBOT_height = Int8(serder.value)
    }
    
    @IBAction func rangeAction(serder: UISlider) {
        print(serder.value)
        rangeValue.text = "\(Int(serder.value))"
        RobotFunction.setStepLength(length: Int(serder.value))
//        saveKeyToValue(key: "RangeKey", value: Int(serder.value))
        ROBOT_stepLength = Int8(serder.value)
    }
    
    @IBAction func heightRestAction(serder: UIButton) {
        heightSlider.value = 60
        heightSlider.setValue(60, animated: false)
        heightValue.text = "60"
        RobotFunction.heightControl(height: 75 + 60 * 2 / 5)
//        saveKeyToValue(key: "HeightKey", value: 60)
        ROBOT_height = 60
    }
    
    @IBAction func rangeRestAction(serder: UIButton) {
        setpSlider.value = 60
        setpSlider.setValue(60, animated: false)
        rangeValue.text = "60"
        RobotFunction.setStepLength(length: 60)
//        saveKeyToValue(key: "RangeKey", value: 60)
        ROBOT_stepLength = 60
    }
    
    
}
