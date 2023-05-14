//
//  InputAddressViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit
import libSwiftSocket

class InputAddressViewController: BaseViewController,ChannelObserver {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 17.5
        confirmButton.layer.masksToBounds = true
        confirmButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        textField.keyboardType = .numbersAndPunctuation
        textField.text = "192.168.50.133"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func confirmButton(serder: UIButton) {
        
        //        NetHelper().makeLogon()
        //
        if isValidIPAddress(textField.text!){
            SOCKETMANAGER = SocketClient()
            SOCKETMANAGER?.setObserver(observer: self)
            SOCKETMANAGER?.connect(host: textField.text!)
        }else{
            showError("The IP address you entered is not valid.")
        }
    }
    
    func isValidIPAddress(_ ipAddress: String) -> Bool {
        let ipAddressRegex = #"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"#
        let ipAddressPredicate = NSPredicate(format: "SELF MATCHES %@", ipAddressRegex)
        return ipAddressPredicate.evaluate(with: ipAddress)
    }
    
    func showError(_ message: String){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didRead buffer: libSwiftSocket.ByteBuffer) {
        
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didDisconnect error: libSwiftSocket.ChannelError?) {
        showError("Robot connect failed :\(error)")
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didConnect host: String, port: Int) {
        DispatchQueue.main.async {
            let homeVC = HomeViewController.loadFromStoryboard("Main")
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didWrite buffer: libSwiftSocket.ByteBuffer, userInfo: [String : Any]?) {
    }
}
