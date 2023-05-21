//
//  HomeViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var performanceView: UIView!
    @IBOutlet weak var radioControllView: UIView!
    @IBOutlet weak var performanceLabel: UILabel!
    @IBOutlet weak var radioLabel: UILabel!
    
    @IBOutlet weak var debugModeSetting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTap()
        
        performanceLabel.text = "表演".localized
        radioLabel.text = "遥控".localized
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaultsManager.shared.developMode{
            debugModeSetting.isHidden = false
        }else{
            debugModeSetting.isHidden = true
        }
    }
    
    func addTap() {
        
        let performanceTap = UITapGestureRecognizer(target: self, action: #selector(performanceClick))
        performanceView.addGestureRecognizer(performanceTap)
        
        let radioControllTap = UITapGestureRecognizer(target: self, action: #selector(radioControllClick))
        radioControllView.addGestureRecognizer(radioControllTap)
        
    }
    
    @objc func performanceClick() {
        let performanceVC = PerformanceViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(performanceVC, animated: true)
    }
    
    @objc func radioControllClick() {
        let radioVC = RadioControllViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(radioVC, animated: true)
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingAction(serder: UIButton) {
        let settingVC = BaseSettingViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    @IBAction func menuAction(serder: UIButton) {
        let menuVC = MenuViewController.loadFromStoryboard("Main")
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    
    
}
