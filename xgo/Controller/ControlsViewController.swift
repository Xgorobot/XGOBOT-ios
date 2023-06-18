//
//  ControlsViewController.swift
//  xgo
//
//  Created by 王壮 on 2023/6/11.
//

import UIKit

class ControlsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func statrButtonClick(_ sender: UIButton) {
        UDPSENDER?.sendUDPMessage(message: "0")
    }
    
    @IBAction func endButtonClick(_ sender: UIButton) {
        UDPSENDER?.sendUDPMessage(message: "1")
    }
    
}
