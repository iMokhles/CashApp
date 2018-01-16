//
//  OffersViewController.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import FontAwesomeSwift
import InteractiveSideMenu

class OffersViewController: UIViewController, SideMenuItemContent {
    
    @IBOutlet weak var tableView: UITableView!
    var adItems: [CAAd]!
    
    fileprivate func getAllAds() {
        
        let ads = CDCrud.sharedCrud.readAllObjects(entityName: "CAAd")
        if ((ads?.count)! > 0) {
            adItems = ads as! [CAAd]
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Offers"
        
        FunctionsHelper.sharedManager.addLeftButtonBar(vc: self, icon: .FABars) { (btn) in
            if let navigationViewController = self.navigationController as? SideMenuItemContent {
                navigationViewController.showSideMenu()
            }
        }
        
        tableView.tableFooterView = UIView()
        
        getAllAds()
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

extension OffersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (adItems != nil) {
            return adItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let offerCell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as! OfferCell
        
        let adItem = adItems[indexPath.row]
        
        offerCell.configureCell(withOffer: adItem)
        
        return offerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let view = UIView()
        view.backgroundColor = AppConstant.grayChateau
        cell.selectedBackgroundView = view;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
}
