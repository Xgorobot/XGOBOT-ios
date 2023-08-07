//
//  LanguageManager.swift
//  xgo
//
//  Created by Mac on 2023/5/16.
//

import Foundation

class LanguageManager {
    
    static var shared = LanguageManager()
    
    var languageFileName: String = {
        var lang = ""
        if let localLanguage =
            UserDefaults.standard.string(forKey: "languageFileName") {
            if localLanguage == "Auto" {
                lang = Locale.preferredLanguages.first ?? "English"
                if lang.hasPrefix("zh") {
                    lang = "Chinese"
                } else if lang.hasPrefix("ja") {
                    lang = "Japanese"
                } else {
                    lang = "English"
                }
            } else {
                lang = localLanguage
            }
        }else {
            lang = Locale.preferredLanguages.first ?? "English"
            if lang.hasPrefix("zh") {
                lang = "Chinese"
            } else if lang.hasPrefix("ja") {
                lang = "Japanese"
            } else {
                lang = "English"
            }
        }
        return lang
    }()
    
    func switchLanguage(_ languageFileName: String) {
        if languageFileName == "Auto" {
            let locale = Locale.preferredLanguages.first ?? "English"
            if locale.hasPrefix("zh") {
                self.languageFileName = "Chinese"
            } else if locale.hasPrefix("ja") {
                self.languageFileName = "Japanese"
            } else {
                self.languageFileName = "English"
            }
        } else {
            self.languageFileName = languageFileName
        }
        UserDefaults.standard.set(languageFileName, forKey: "languageFileName")
        UserDefaults.standard.synchronize()
        // 发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadViewController"), object: nil)
    }
    
}
