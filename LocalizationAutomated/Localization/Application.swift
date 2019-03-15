//
//  Application.swift
//  LocalizationAutomated
//
//  Created by Ismail Ahmed on 3/15/19.
//  Copyright © 2019 Ismail Ahmed. All rights reserved.
//

import Foundation
import UIKit

class Application: UIApplication,UIApplicationDelegate {
    
    override open var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        
        get {
            
            if LanguageManager.isCurrentLanguageRTL() {
                
                return .rightToLeft
                
            }else {
                
                return .leftToRight
                
            }
            
        }
    }
    
}
