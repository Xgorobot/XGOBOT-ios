//
//  WiFiViewController.swift
//  xgo
//
//  Created by 王壮 on 2023/6/11.
//

import UIKit

class WiFiViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var wifiField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var codeImage: UIImageView!
    @IBOutlet weak var codeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wifiField.attributedPlaceholder = NSAttributedString(string: "请输入WiFi", attributes: [.foregroundColor:UIColor(hexString: "#8BA4C7") ?? .white])
        wifiField.textColor = UIColor.white
        wifiField.layer.cornerRadius = 4
        wifiField.layer.borderColor = UIColor(hexString: "#172A51")?.cgColor
        wifiField.layer.borderWidth = 1
        passwordField.attributedPlaceholder = NSAttributedString(string: "请输入密码", attributes: [.foregroundColor:UIColor(hexString: "#8BA4C7") ?? .white])
        passwordField.textColor = UIColor.white
        passwordField.layer.cornerRadius = 4
        passwordField.layer.borderColor = UIColor(hexString: "#172A51")?.cgColor
        passwordField.layer.borderWidth = 1
        codeButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        codeButton.layer.cornerRadius = 20
        codeButton.layer.masksToBounds = true
        titleLabel.text = "机器人配网".localized
        descLabel.text = "请输入WI-FI名称和密码".localized
        wifiField.placeholder = "请输入WI-FI".localized
        passwordField.placeholder = "请输入密码".localized
        codeButton.titleLabel?.text = "生成二维码".localized
        
    }
    
    @IBAction func codeButtonClick(_ sender: UIButton) {
        if wifiField.text?.count == 0 {
            return
        }
        
        if passwordField.text?.count == 0 {
            return
        }
        
        codeImage.image = self.generateQRCode(str: self.setCodeString(ssid: wifiField.text ?? "", password: passwordField.text ?? ""))
        
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setCodeString(ssid: String, password: String) -> String {
        var str = ""
        str.append("WIFI:")
        // 添加SSID
        str.append("S:")
        str.append(ssid)
        str.append(";")
        // 添加密码
        str.append("T:")
        str.append("WPA")
        str.append(";")
        str.append("P:")
        str.append(password)
        str.append(";")
        // 添加隐藏网络标志位（可选）
        str.append("H:")
        str.append("false")
        str.append(";")
        return str
    }
    
    func generateQRCode(str: String) -> UIImage? {
        let data = str.data(using: String.Encoding.ascii)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 9, y: 9)
        guard let output = filter.outputImage?.transformed(by: transform) else { return nil }
        return UIImage(ciImage: output)
    }
    
}
