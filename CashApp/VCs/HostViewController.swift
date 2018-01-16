//
//  HostViewController.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import InteractiveSideMenu


class HostViewController: MenuContainerViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.4, visibleContentWidth: screenSize.width / 6)
        
        self.menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "NavigationMenu") as! MenuViewController
        
        // Gather content items controllers
        self.contentViewControllers = contentControllers()
        
        // Select initial content controller. It's needed even if the first view controller should be selected.
        self.selectContentViewController(contentViewControllers.first!)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        /*
         Options to customize menu transition animation.
         */
        var options = TransitionOptions()
        
        // Animation duration
        options.duration = size.width < size.height ? 0.4 : 0.6
        
        // Part of item content remaining visible on right when menu is shown
        options.visibleContentWidth = size.width / 6
        self.transitionOptions = options
    }
    
    private func contentControllers() -> [UIViewController] {
        let controllersIdentifiers = [
            "offersNVC",
            "myEarningNVC",
            "shareNVC",
            "promoteYourAppNVC",
            "rankingNVC",
            "faqNVC",
            "contactUsNVC",
            "facebookNVC",
            "twitterNVC",
            "privacyAndTermsNVC",
            "aboutUsNVC"
            ]
        var contentList = [NavigationViewController]()
        
        /*
         Instantiate items controllers from storyboard.
         */
        for identifier in controllersIdentifiers {
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) {
                contentList.append(viewController as! NavigationViewController)
            }
        }
        
        return contentList
    }
}
