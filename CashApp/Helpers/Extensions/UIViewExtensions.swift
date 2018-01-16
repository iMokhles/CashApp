//
//  UIViewExtensions.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CAView: UIView {
    
    @IBInspectable public var shadowOffset: CGSize = CGSize.init(width:0, height:0) {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 1 {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    fileprivate func setupView(){
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        setupBorderAndCorners()
        setupShadow()
    }
    
    fileprivate func setupBorderAndCorners() {
       self.layer.cornerRadius = cornerRadius
    }
    fileprivate func setupShadow(){
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowColor = shadowColor.cgColor
    }
}

