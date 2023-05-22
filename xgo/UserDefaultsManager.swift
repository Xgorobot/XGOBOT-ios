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
        static let developMode = "developMode"
        // add more keys as needed
    }
    
    // MARK: - Properties
    
    var host: String? {
        get { return UserDefaults.standard.string(forKey: Keys.host) }
        set { UserDefaults.standard.set(newValue, forKey: Keys.host) }
    }
    
    var cameraPort: Int {
        get {
            return UserDefaults.standard.integer(forKey: Keys.cameraPort) == 0 ? 6060 : UserDefaults.standard.integer(forKey: Keys.cameraPort)
        }
        set { UserDefaults.standard.set(newValue, forKey: Keys.cameraPort) }
    }
    
    var developMode: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.developMode)
            
        }
        set { UserDefaults.standard.set(newValue, forKey: Keys.developMode) }
    }
    
    // add more properties as needed
    
    // MARK: - Methods
    
    func clearAll() {
        UserDefaults.standard.removeObject(forKey: Keys.host)
        UserDefaults.standard.removeObject(forKey: Keys.cameraPort)
        UserDefaults.standard.removeObject(forKey: Keys.developMode)
        // remove other keys as needed
    }
}
