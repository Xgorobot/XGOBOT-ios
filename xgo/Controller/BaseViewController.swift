//
//  BaseViewController.swift
//  xgo
//
//  Created by Mac on 2023/5/8.
//

import UIKit

class BaseViewController: UIViewController {
    
    var preciseObserve: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.preciseObserve == nil {
            self.preciseObserve = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "reloadViewController"), object: nil, queue: nil) { [weak self] noti in
                self?.refreshView()
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @objc func refreshView() {
        self.reload(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func reload(_ viewController: UIViewController?) {
        viewController?.viewWillDisappear(true)
        viewController?.viewDidDisappear(true)
        viewController?.viewDidLoad()
        viewController?.viewWillAppear(true)
        viewController?.viewDidAppear(true)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
    
}
