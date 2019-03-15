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
        object_setClass(Bundle.main, object_getClass(BundleEx())!)
    }()
    static func setLanguage(language : String) {
        Bundle.once_action
        let rtl = LanguageManager.isCurrentLanguageRTL()
        if rtl {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        UserDefaults.standard.set(rtl, forKey: "AppleTextDirection")
        UserDefaults.standard.set(rtl, forKey: "NSForceRightToLeftWritingDirection")
        
        let value = Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)
        
        objc_setAssociatedObject(Bundle.main, &kBundleKey, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//        object_setClass([NSBundle mainBundle], [BundleEx class]);
//        });
//        if ([LanguageManager isCurrentLanguageRTL]) {
//            if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
//                [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
//                [[UITableView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
//            }
//        }else {
//            if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
//                [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
//                [[UITableView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
//            }
//        }
//        [[NSUserDefaults standardUserDefaults] setBool:[LanguageManager isCurrentLanguageRTL] forKey:@"AppleTextDirection"];
//        [[NSUserDefaults standardUserDefaults] setBool:[LanguageManager isCurrentLanguageRTL] forKey:@"NSForceRightToLeftWritingDirection"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//
//        id value = language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil;
//        objc_setAssociatedObject([NSBundle mainBundle], &kBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

