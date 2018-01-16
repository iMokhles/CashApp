//
//  RankingViewController.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift
import InteractiveSideMenu

class RankingViewController: UIViewController, SideMenuItemContent {
    
    @IBOutlet weak var tableView: UITableView!
    var rankItems: [CARank]!

    fileprivate func getAllRanks() {
        
        let ranks = CDCrud.sharedCrud.readAllObjects(entityName: "CARank")
        if ((ranks?.count)! > 0) {
            rankItems = ranks as! [CARank]
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Ranking"
        
        FunctionsHelper.sharedManager.addLeftButtonBar(vc: self, icon: .FABars) { (btn) in
            if let navigationViewController = self.navigationController as? SideMenuItemContent {
                navigationViewController.showSideMenu()
            }
        }
        
        tableView.tableFooterView = UIView()
        
        getAllRanks()
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

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (rankItems != nil) {
            return rankItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rankCell = tableView.dequeueReusableCell(withIdentifier: "rankCell") as! RankCell

        let rankItem = rankItems[indexPath.row]
        
        rankCell.configureCell(withRank: rankItem)
        
        return rankCell
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
        return 80
    }
}
