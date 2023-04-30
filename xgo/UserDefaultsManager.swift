//
//  UserDatas.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/30.
//

import Foundation
class UserDefaultsManager {
    
    // MARK: - Singleton
    
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    // MARK: - Keys
    
    private struct Keys {
        static let host = "host"
        static let cameraPort = "cameraPort"
        // add more keys as needed
    }
    
    // MARK: - Properties
    
    var host: String? {
        get { return UserDefaults.standard.string(forKey: Keys.host) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.host) }
    }
    
    var cameraPort: Bool {
        get { return UserDefaults.standard.bool(forKey: Keys.cameraPort) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.cameraPort) }
    }
    
    // add more properties as needed
    
    // MARK: - Methods
    
    func clearAll() {
        UserDefaults.standard.removeObject(forKey: Keys.host)
        UserDefaults.standard.removeObject(forKey: Keys.cameraPort)
        // remove other keys as needed
    }
}
