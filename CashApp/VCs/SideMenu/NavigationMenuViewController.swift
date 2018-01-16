//
//  NavigationMenuViewController.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import InteractiveSideMenu
import FontAwesomeSwift

class NavigationMenuViewController: MenuViewController {
    
    let kCellReuseIdentifier = "MenuCell"
    let menuItems = [
//        [
//            "title": "Home",
//            "icon" : FAType.FAHome,
//            "color": UIColor.white
//        ],
        [
            "title": "Offers",
            "icon" : FAType.FAMoney,
            "color": UIColor.white
        ],
        [
            "title": "My Earning",
            "icon" : FAType.FAList,
            "color": UIColor.white
        ],
        [
            "title": "Share",
            "icon" : FAType.FAShareAlt,
            "color": UIColor.white
        ],
        [
            "title": "Promote Your App",
            "icon" : FAType.FASitemap,
            "color": UIColor.white
        ],
        [
            "title": "Ranking",
            "icon" : FAType.FACertificate,
            "color": UIColor.white
        ],
        [
            "title": "FAQ",
            "icon" : FAType.FAQuestionCircle,
            "color": UIColor.white
        ],
        [
            "title": "Contact-Us",
            "icon" : FAType.FAEnvelope,
            "color": UIColor.white
        ],
        [
            "title": "Facebook",
            "icon" : FAType.FAFacebook,
            "color": UIColor.white
        ],
        [
            "title": "Twitter",
            "icon" : FAType.FATwitter,
            "color": UIColor.white
        ],
        [
            "title": "Privacy And Termes",
            "icon" : FAType.FAUserSecret,
            "color": UIColor.white
        ],
        [
            "title": "About-Us",
            "icon" : FAType.FAInfoCircle,
            "color": UIColor.white
        ]
    ]
    
    @IBOutlet weak var tableHeader: MenuHeader!
    @IBOutlet weak var tableView: UITableView!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Select the initial row
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.none)
        
        tableHeader.configureHeader(withName: "Mokhlas Hussein", subName: "Balance: 38.90$", avatarUrl: AppConstant.kDemoAvatar1)
    }
}

extension NavigationMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuCell
        let menuItem = menuItems[indexPath.row] as [String:Any]
        
        menuCell.configureCell(withTitle: menuItem["title"] as! String, icon: menuItem["icon"] as! FAType, color: menuItem["color"] as! UIColor)
        
        return menuCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
    menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[indexPath.row])
        menuContainerViewController.hideSideMenu()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let view = UIView()
        view.backgroundColor = AppConstant.kMenuCellSelectionColor_blue
        cell.selectedBackgroundView = view;
    }
}
