//
//  RadioControllViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit

class RadioControllViewController: UIViewController {
    
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
    
    var poseModelVC = PoseModelViewController.loadFromStoryboard("Main")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(poseModelVC)
        self.view.addSubview(poseModelVC.view)
        
        poseModelVC.view.isHidden = true
        
        
    }
    
    @IBAction func motionAction(serder: UIButton!) {
        
    }
    
    @IBAction func poseAction(serder: UIButton) {
        poseModelVC.view.isHidden = false
    }
    
    @IBAction func leftAction(serder: UIButton) {
        
    }
    
    @IBAction func rightAction(serder: UIButton) {
        
    }
    
    @IBAction func directionAction(serder: UIButton) {
        
    }
    
    @IBAction func trotAction(serder: UIButton) {
        
    }
    
    @IBAction func walkAction(serder: UIButton) {
        
    }
    
    @IBAction func grab(serder: UIButton) {
        
    }
    
    @IBAction func upAction(serder: UIButton) {
        
    }
    
    @IBAction func middleAction(serder: UIButton) {
        
    }
    
    @IBAction func downAction(serder: UIButton) {
        
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
