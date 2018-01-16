//
//  WKViewExtensions.swift
//  CashApp
//
//  Created by iMokhles on 07/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import WebKit
import UIKit

@IBDesignable
class CAWebKitView: WKWebView {
    
    @IBInspectable public var webSiteUrl: String = "https://google.com" {
        didSet{
            setupView()
        }
    }
    
    fileprivate func setupView(){
        loadSiteUrl()
    }
    
    fileprivate func loadSiteUrl() {
        load(URLRequest(url: URL(string: webSiteUrl)!))
    }
}

@IBDesignable
class CAWebView: UIWebView {
    
    @IBInspectable public var webSiteUrl: String = "https://google.com" {
        didSet{
            setupView()
        }
    }
    
    fileprivate func setupView(){
        loadSiteUrl()
    }
    
    fileprivate func loadSiteUrl() {
        loadRequest(URLRequest(url: URL(string: webSiteUrl)!))
    }
}
