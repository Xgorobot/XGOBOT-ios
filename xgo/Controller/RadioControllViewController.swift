//
//  RadioControllViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit
import WebKit

class RadioControllViewController: BaseViewController {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var motionButton: UIButton!
    @IBOutlet weak var poseButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var trotButton: UIButton!
    @IBOutlet weak var walkButton: UIButton!
    @IBOutlet weak var grabButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
    var poseModelVC = PoseModelViewController.loadFromStoryboard("Main")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(poseModelVC)
        self.view.addSubview(poseModelVC.view)
        
        poseModelVC.view.isHidden = true
        
        webView.load(URLRequest(url: RobotFunction.getWebUrl()))
        
        
        leftButton.setBackgroundImage(UIImage(named: "zuozhuan"), for: .normal)
        leftButton.setBackgroundImage(UIImage(named: "zuozhuan1"), for: .highlighted)
        
        rightButton.setBackgroundImage(UIImage(named: "youzhuan"), for: .normal)
        rightButton.setBackgroundImage(UIImage(named: "youzhuan1"), for: .highlighted)
        
        trotButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        trotButton.setBackgroundImage(UIImage(named: "dian"), for: .selected)
        
        walkButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        walkButton.setBackgroundImage(UIImage(named: "dian"), for: .selected)
        
        grabButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        grabButton.setBackgroundImage(UIImage(named: "dian"), for: .selected)
        
        upButton.setBackgroundImage(UIImage(named: "zs"), for: .normal)
        upButton.setBackgroundImage(UIImage(named: "zs1"), for: .highlighted)
        
        middleButton.setBackgroundImage(UIImage(named: "zz"), for: .normal)
        middleButton.setBackgroundImage(UIImage(named: "zz1"), for: .highlighted)
        
        downButton.setBackgroundImage(UIImage(named: "zx"), for: .normal)
        downButton.setBackgroundImage(UIImage(named: "zx1"), for: .highlighted)
        
    }
    
    @IBAction func motionAction(serder: UIButton!) {
        
    }
    
    @IBAction func leftTD(_ sender: UIButton) {
        RobotFunction.btnControl(direction: 5)
    }
    
    @IBAction func leftTU(_ sender: UIButton) {
        RobotFunction.btnControl(direction: 0)
    }
    
    @IBAction func rightTD(_ sender: Any) {
        RobotFunction.btnControl(direction: 6)
    }
    
    @IBAction func rightTU(_ sender: Any) {
        RobotFunction.btnControl(direction: 0)
    }
    
    
    @IBAction func poseAction(serder: UIButton) {
        poseModelVC.view.isHidden = false
    }
    
    
    @IBAction func directionAction(serder: UIButton) {
        if serder.isHighlighted{
            RobotFunction.btnControl(direction: 1)
            //direction：0=停止，1=向前，2=向后，3=向左，4=向右，5=左旋，6=右旋
        }else{
            RobotFunction.btnControl(direction: 0)
        }
    }
    
    @IBAction func trotAction(serder: UIButton) {
        trotButton.isSelected = true
        walkButton.isSelected = false
        RobotFunction.setStepState(state: 0)
    }
    
    @IBAction func walkAction(serder: UIButton) {
        trotButton.isSelected = false
        walkButton.isSelected = true
        RobotFunction.setStepState(state: 1)
    }
    
    @IBAction func grab(serder: UIButton) {
        serder.isSelected = !serder.isSelected
    }
    
    @IBAction func upAction(serder: UIButton) {
        RobotFunction.grap(state: 128)
    }
    
    @IBAction func middleAction(serder: UIButton) {
        RobotFunction.grap(state: 129)
    }
    
    @IBAction func downAction(serder: UIButton) {
        RobotFunction.grap(state: 130)
    }
    
    @IBAction func settingAction(serder: UIButton) {
        let setVC = RadioControllSettingViewController.loadFromStoryboard("Main")
        setVC.modalPresentationStyle = .overCurrentContext
        self.present(setVC, animated: false)
        
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
