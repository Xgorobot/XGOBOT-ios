//
//  InputAddressViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class InputAddressViewController: BaseViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 17.5
        confirmButton.layer.masksToBounds = true
        confirmButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func confirmButton(serder: UIButton) {
        let homeVC = HomeViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(homeVC, animated: true)

//        NetHelper().makeLogon()
//        
        SOCKETMANAGER = SocketClient()
        SOCKETMANAGER?.connect(host: "192.168.201.146")
    }
    
    
    
}
