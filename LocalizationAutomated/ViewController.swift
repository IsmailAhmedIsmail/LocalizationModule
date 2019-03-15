//
//  ViewController.swift
//  LocalizationAutomated
//
//  Created by Ismail Ahmed on 3/13/19.
//  Copyright © 2019 Ismail Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var warningImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.hello
        warningImageView.image = UIImage(named: L10n.Images.warning)
    }

    @IBAction func didPressEnglish(_ sender: Any) {
        LanguageManager.currentLanguage = "en"
        reloadRootView()
    }
    
    @IBAction func didPressArabic(_ sender: Any) {
        LanguageManager.currentLanguage = "ar"
        reloadRootView()
    }
    
    private func reloadRootView() {
        
        if let appDelegate = UIApplication.shared.delegate {
            let initialStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            appDelegate.window??.rootViewController = initialStoryBoard.instantiateInitialViewController()
        }
    }
}

