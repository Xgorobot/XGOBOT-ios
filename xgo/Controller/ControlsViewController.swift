//
//  ControlsViewController.swift
//  xgo
//
//  Created by 王壮 on 2023/6/11.
//

import UIKit

class ControlsViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
