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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var verLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 17.5
        confirmButton.layer.masksToBounds = true
        confirmButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        textField.keyboardType = .numbersAndPunctuation
        textField.placeholder = "172.0.0.1"
        textField.text = UserDefaultsManager.shared.host
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        
        titleLabel.text = "请输入机器人IP地址".localized
        confirmButton.setTitle("确定".localized, for: .normal)
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            print("当前应用版本号为：\(version)")
            verLabel.text = "v\(version)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func confirmButton(serder: UIButton) {

        if isValidIPAddress(textField.text!){
            UserDefaultsManager.shared.host = textField.text
            SOCKETMANAGER = SocketClient()
            SOCKETMANAGER?.setObserver(observer: self)
            SOCKETMANAGER?.connect(host: textField.text!)

            DispatchQueue.main.async {
                self.confirmButton.isEnabled = false
            }
        }else{
            showError("The IP address you entered is not valid.")
        }
        
//            let homeVC = HomeViewController.loadFromStoryboard("Main")
//            self.navigationController?.pushViewController(homeVC, animated: true)
//            self.navigationController?.viewControllers.remove(at: 0)
        
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
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didRead buffer: libSwiftSocket.ByteBuffer) {
        
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didDisconnect error: libSwiftSocket.ChannelError?) {
        DispatchQueue.main.async {
            var errorMsg:String = error?.description ?? "unknow"
            self.showError("Robot connect failed : \(errorMsg)")
            self.confirmButton.isEnabled = true
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didConnect host: String, port: Int) {
        DispatchQueue.main.async {
            let homeVC = HomeViewController.loadFromStoryboard("Main")
            self.navigationController?.pushViewController(homeVC, animated: true)
            self.navigationController?.viewControllers.remove(at: 0)
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didWrite buffer: libSwiftSocket.ByteBuffer, userInfo: [String : Any]?) {
    }
    
    @IBAction func controlsButtonClick(_ sender: Any) {
        
        let vc = ControlsViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func wifiButtonClick(_ sender: Any) {
        
        let vc = WiFiViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
