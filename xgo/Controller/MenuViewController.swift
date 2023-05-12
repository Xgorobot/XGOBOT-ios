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
        
        startButton.layer.cornerRadius = 17.5
        startButton.layer.masksToBounds = true
        startButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
        
        let menuVewi = MenuShowView()
        self.view.addSubview(menuVewi)
        
//        menuVewi.button.layer.cornerRadius = 15.5
//        menuVewi.button.layer.masksToBounds = true
//        menuVewi.button.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
    }
    
    @IBAction func starAction(serder: UIButton) {
        
    }
    
    @IBAction func finishAction(serder: UIButton) {
        
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
