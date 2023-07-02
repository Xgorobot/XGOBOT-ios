//
//  BaseSettingViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit
import libSwiftSocket

class BaseSettingViewController: BaseViewController,ChannelObserver {
    
    
    
    
    @IBOutlet weak var equipmentInfo: UILabel!
    
    @IBOutlet weak var systemButton: UIButton!
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var japaneseButton: UIButton!
    var languageButtonArray: [UIButton]! = []
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var developButtonArray: [UIButton]! = []
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var optionTitle: UILabel!
    @IBOutlet weak var optionDesc: UILabel!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageButtonArray = []
        developButtonArray = []
        initSetButtonStyle()
        
        titleLabel.text = "基础设置".localized
        languageLabel.text = "语言选择".localized
        optionTitle.text = "开发选项".localized
        optionDesc.text = "以开发者身份运行此项目".localized
        infoTitle.text = "设备信息".localized
        systemButton.setTitle("跟随系统".localized, for: .normal)
        yesButton.setTitle("是".localized, for: .normal)
        noButton.setTitle("否".localized, for: .normal)
        chineseButton.setTitle("中文".localized, for: .normal)
        englishButton.setTitle("English".localized, for: .normal)
        japaneseButton.setTitle("日本".localized, for: .normal)
        
        if let localLanguage = UserDefaults.standard.string(forKey: "languageFileName") {
            if localLanguage == "Auto" {
                setButtonSelect(index: 0)
            } else if localLanguage == "English" {
                setButtonSelect(index: 2)
            } else if localLanguage == "Japanese"{
                setButtonSelect(index: 3)
            } else {
                setButtonSelect(index: 1)
            }
        }
        infoTitle.isHidden = true
        equipmentInfo.isHidden = true
        setSocketListener()
    }
    
    func setButtonSelect(index: Int) {
        for i in 0..<languageButtonArray.count {
            if i == index {
                languageButtonArray[i].isSelected = true
            } else {
                languageButtonArray[i].isSelected = false
            }
        }
    }
    
    func initSetButtonStyle() {
        
        systemButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        systemButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        systemButton.setTitleColor(UIColor.white, for: .selected)
        systemButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        systemButton.isSelected = true
        
        chineseButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        chineseButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        chineseButton.setTitleColor(UIColor.white, for: .selected)
        chineseButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        englishButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        englishButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        englishButton.setTitleColor(UIColor.white, for: .selected)
        englishButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        
        japaneseButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        japaneseButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        japaneseButton.setTitleColor(UIColor.white, for: .selected)
        japaneseButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        yesButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        yesButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        yesButton.setTitleColor(UIColor.white, for: .selected)
        yesButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        
        
        noButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        noButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        noButton.setTitleColor(UIColor.white, for: .selected)
        noButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        if UserDefaultsManager.shared.developMode{
            yesButton.isSelected = true
        }else{
            noButton.isSelected = true
        }
        
        languageButtonArray.append(contentsOf: [systemButton, chineseButton, englishButton, japaneseButton])
        developButtonArray.append(contentsOf: [yesButton, noButton])
        
    }
    
    
    @IBAction func languageButtonClick(serder: UIButton) {
        if serder.currentTitle == "中文" {
            LanguageManager.shared.switchLanguage("Chinese")
        } else if serder.currentTitle == "English" {
            LanguageManager.shared.switchLanguage("English")
        } else if serder.currentTitle == "日本" {
            LanguageManager.shared.switchLanguage("Japanese")
        } else {
            LanguageManager.shared.switchLanguage("Auto")
        }
    }
    
    @IBAction func developButtonClick(serder: UIButton) {
        for item in developButtonArray {
            if item.currentTitle == serder.currentTitle {
                item.isSelected = true
            } else {
                item.isSelected = false
            }
        }
        if serder == yesButton{
            UserDefaultsManager.shared.developMode = true
        }else{
            UserDefaultsManager.shared.developMode = false
        }
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
        
    func setSocketListener() {
        SOCKETMANAGER?.setObserver(observer: self)
        RobotFunction.loadDeviceVersion()
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didConnect host: String, port: Int) {
        
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didWrite buffer: libSwiftSocket.ByteBuffer, userInfo: [String : Any]?) {
        
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didRead buffer: libSwiftSocket.ByteBuffer) {
        DispatchQueue.main.async {
            // 在主线程上执行的代码
            let msg = String(data: buffer.toData(), encoding: .utf8) ?? "NULL"
            
            let tag = msg[msg.index(msg.startIndex, offsetBy: 3)..<msg.index(msg.startIndex, offsetBy: 5)]
            let data = msg[msg.index(msg.startIndex, offsetBy: 7)..<msg.index(msg.startIndex, offsetBy: 9)]

            print("onMsgReceived: tag: \(tag)  data: \(data)")

            if tag == "34" {
                if data == "00" {
                    DispatchQueue.main.async {
                        self.equipmentInfo.text = "XGO-lite2"
                        self.infoTitle.isHidden = false
                        self.equipmentInfo.isHidden = false
                    }
                } else if data == "01" {
                    DispatchQueue.main.async {
                        self.equipmentInfo.text = "XGO-mini2"
                        self.infoTitle.isHidden = false
                        self.equipmentInfo.isHidden = false
                    }
                }
            }
        }
    }
    
    func channel(_ client: libSwiftSocket.ClientChannel, didDisconnect error: libSwiftSocket.ChannelError?) {
        
    }
    
}
