//
//  AppDelegate.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MainNavigationController(rootViewController: InputAddressViewController.loadFromStoryboard("Main"))
        window?.makeKeyAndVisible()
        
        return true
    }

}

