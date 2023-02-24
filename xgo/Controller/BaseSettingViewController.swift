//
//  BaseSettingViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class BaseSettingViewController: UIViewController {
    
    @IBOutlet weak var equipmentInfo: UILabel!
    
    @IBOutlet weak var systemButton: UIButton!
    @IBOutlet weak var chineseButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    var languageButtonArray: [UIButton]! = []
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var developButtonArray: [UIButton]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSetButtonStyle()
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
        
        yesButton.isSelected = true
        
        noButton.setImage(UIImage(named: "radiobuttonunselect"), for: .normal)
        noButton.setImage(UIImage(named: "radiobuttonselect"), for: .selected)
        noButton.setTitleColor(UIColor.white, for: .selected)
        noButton.setTitleColor(UIColor(red: 139, green: 164, blue: 199, alpha: 1), for: .normal)
        
        languageButtonArray.append(contentsOf: [systemButton, chineseButton, englishButton])
        developButtonArray.append(contentsOf: [yesButton, noButton])
        
    }
    
    
    @IBAction func languageButtonClick(serder: UIButton) {
        for item in languageButtonArray {
            if item.currentTitle == serder.currentTitle {
                item.isSelected = true
            } else {
                item.isSelected = false
            }
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
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
