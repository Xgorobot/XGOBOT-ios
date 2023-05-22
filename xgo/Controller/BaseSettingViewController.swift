//
//  BaseSettingViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class BaseSettingViewController: BaseViewController {
    
    @IBOutlet weak var equipmentInfo: UILabel!
    
    @IBOutlet weak var systemButton: UIButton!
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
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
        
        if let localLanguage = UserDefaults.standard.string(forKey: "languageFileName") {
            if localLanguage == "Auto" {
                setButtonSelect(index: 0)
            } else if localLanguage == "English" {
                setButtonSelect(index: 2)
            } else {
                setButtonSelect(index: 1)
            }
        }
        infoTitle.isHidden = true
        equipmentInfo.isHidden = true
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
        
        languageButtonArray.append(contentsOf: [systemButton, chineseButton, englishButton])
        developButtonArray.append(contentsOf: [yesButton, noButton])
        
    }
    
    
    @IBAction func languageButtonClick(serder: UIButton) {
        if serder.currentTitle == "中文" {
            LanguageManager.shared.switchLanguage("Chinese")
        } else if serder.currentTitle == "English" {
            LanguageManager.shared.switchLanguage("English")
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
    
}
