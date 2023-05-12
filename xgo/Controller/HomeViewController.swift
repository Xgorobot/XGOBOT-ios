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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTap()
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
