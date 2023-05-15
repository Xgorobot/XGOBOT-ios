//
//  MenuViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishButton.layer.borderColor = UIColor(hexString: "#3E67F7")!.cgColor
        finishButton.layer.borderWidth = 1
        finishButton.layer.cornerRadius = 17.5
        finishButton.layer.masksToBounds = true
        finishButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .highlighted)
        
        startButton.layer.cornerRadius = 17.5
        startButton.layer.masksToBounds = true
        startButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .highlighted)
        
        
        let menuVewi = MenuShowView()
        self.view.addSubview(menuVewi)
        
//        menuVewi.button.layer.cornerRadius = 15.5
//        menuVewi.button.layer.masksToBounds = true
//        menuVewi.button.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
    }
    
    @IBAction func starAction(serder: UIButton) {
        RobotFunction.setDebugMode(enable: true)
        startButton.isHighlighted = true
        finishButton.isHighlighted = false
    }
    
    @IBAction func finishAction(serder: UIButton) {
        RobotFunction.setDebugMode(enable: false)
        startButton.isHighlighted = false
        finishButton.isHighlighted = true
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
