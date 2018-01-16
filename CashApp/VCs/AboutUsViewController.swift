//
//  AboutUsViewController.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import FontAwesomeSwift
import InteractiveSideMenu

class AboutUsViewController: UIViewController, SideMenuItemContent {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "About Us"
        
        FunctionsHelper.sharedManager.addLeftButtonBar(vc: self, icon: .FABars) { (btn) in
            if let navigationViewController = self.navigationController as? SideMenuItemContent {
                navigationViewController.showSideMenu()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func menuBtnTapped() {
        print("Tapped")
        self.showSideMenu()
        
    }
}
