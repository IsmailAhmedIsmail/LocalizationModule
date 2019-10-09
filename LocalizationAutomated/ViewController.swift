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
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.hello
        warningImageView.image = UIImage(named: L10n.Images.warning)
        title = L10n.Ragab.ragaboolean
        title = L10n.test
        // using date formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let _ = formatter.string(from: Date())
        
        // applying custom localized format
        let dateFormat = "dMY"
        let _ = formatter.setLocalizedDateFormatFromTemplate(dateFormat)
        
        
        // using date components and its formatter
        var dateComponents = DateComponents()
        let componentsFormatter = DateComponentsFormatter()
        dateComponents.month = 4
        dateComponents.year = 5
        let _ = componentsFormatter.string(from: dateComponents)
        
        
        // flipping image programatically
        arrowImageView.image = #imageLiteral(resourceName: "arrow").imageFlippedForRightToLeftLayoutDirection()
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

