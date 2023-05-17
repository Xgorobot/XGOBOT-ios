//
//  MenuViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finshLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishButton.layer.borderColor = UIColor(hexString: "#3E67F7")!.cgColor
        finishButton.layer.borderWidth = 1
        finishButton.layer.cornerRadius = 17.5
        finishButton.layer.masksToBounds = true
        finishButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .highlighted)
        
        startButton.layer.cornerRadius = 17.5
        startButton.layer.masksToBounds = true
        startButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
        
        let menuVewi = MenuShowView()
        self.view.addSubview(menuVewi)
        
        menuVewi.layer.cornerRadius = 5
        menuVewi.layer.masksToBounds = true
        
        okButton.layer.cornerRadius = 15.5
        okButton.layer.masksToBounds = true
        okButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
        finishButton.setTitle("完成标定".localized, for: .normal)
        startButton.setTitle("开始标定".localized, for: .normal)
        startLabel.text = "点击【开始标定】按照说明书将机器狗摆放为标定姿势".localized
        finshLabel.text = "点击【完成标定】记录当前标定姿势为初始位置，10秒 后恢复默认站姿".localized
        titleLabel.text = "标定模式".localized
        okButton.setTitle("知道了".localized, for: .normal)
        
    }
    
    @IBAction func starAction(serder: UIButton) {
        RobotFunction.setDebugMode(enable: true)
        startButton.isHighlighted = true
        finishButton.isHighlighted = false
    }
    
    @IBAction func finishAction(serder: UIButton) {
        RobotFunction.setDebugMode(enable: false)
        startButton.isHighlighted = false
        finishButton.isHighlighted = true
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
