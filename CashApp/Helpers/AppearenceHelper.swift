//
//  AppearenceHelper.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit

class AppearenceHelper {
    
    class func configureNavigationBar() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.black
        let attributes = [
            NSAttributedStringKey.font : UIFont.exampleAvenirMedium(ofSize: 25),
            NSAttributedStringKey.foregroundColor : UIColor.black
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
}
