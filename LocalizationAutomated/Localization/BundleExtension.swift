//
//  LanguageManager.swift
//  LocalizationAutomated
//
//  Created by Ismail Ahmed on 3/15/19.
//  Copyright © 2019 Ismail Ahmed. All rights reserved.
//

import Foundation
import UIKit
fileprivate var kBundleKey = 0
class BundleEx : Bundle {
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = objc_getAssociatedObject(self, &kBundleKey) as? Bundle {
            return bundle.localizedString(forKey:key, value:value, table:tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        
    }
}

extension Bundle {
    static let once_action : Void = {
        print("executed once")
        object_setClass(Bundle.main, BundleEx.self)
    }()
    static func setLanguage(language : String) {
        Bundle.once_action
        let rtl = LanguageManager.isCurrentLanguageRTL()
        if rtl {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        let value = Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)
        
        objc_setAssociatedObject(Bundle.main, &kBundleKey, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

