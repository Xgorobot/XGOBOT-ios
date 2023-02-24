//
//  MenuViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVewi = MenuShowView()
        self.view.addSubview(menuVewi)
        
    }
    
    @IBAction func starAction(serder: UIButton) {
        
    }
    
    @IBAction func finishAction(serder: UIButton) {
        
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
