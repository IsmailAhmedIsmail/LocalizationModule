//
//  LanguageManager.swift
//  LocalizationAutomated
//
//  Created by Ismail Ahmed on 3/15/19.
//  Copyright © 2019 Ismail Ahmed. All rights reserved.
//

import Foundation


class LanguageManager {
    
    private static let languageSaveKey = "currentLanguageKey"
    static var currentLanguage : String = (UserDefaults.standard.object(forKey: languageSaveKey) as? String) ?? ((UserDefaults.standard.object(forKey: "AppleLanguages") as? [String])?.first)! {
        didSet {
            persistLanguage()
        }
    }
    
    static func persistLanguage() {
        UserDefaults.standard.set(currentLanguage, forKey: languageSaveKey)
        UserDefaults.standard.set([currentLanguage], forKey: "AppleLanguages")
        Bundle.setLanguage(language: currentLanguage)
    }
    
    static func isCurrentLanguageRTL() -> Bool {
        return Locale.characterDirection(forLanguage: currentLanguage) == .rightToLeft
    }
    
}
