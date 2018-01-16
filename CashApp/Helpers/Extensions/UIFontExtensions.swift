//
//  UIFontExtensions.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func exampleAvenirMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func exampleAvenirLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
