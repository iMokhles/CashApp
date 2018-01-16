//
//  TransactionsViewController.swift
//  CashApp
//
//  Created by iMokhles on 11/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var transItems: [CATrans]!
    
    
    fileprivate func getAllTrans() {
        
        let trans = CDCrud.sharedCrud.readAllObjects(entityName: "CATrans")
        if ((trans?.count)! > 0) {
            transItems = trans as! [CATrans]
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Transactions"

        tableView.tableFooterView = UIView()
        
        getAllTrans()
    }
}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (transItems != nil) {
            return transItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let transCell = tableView.dequeueReusableCell(withIdentifier: "transCell") as! TransCell
        
        let transItem = transItems[indexPath.row]
        
        transCell.configureCell(withTrans: transItem)
        
        return transCell
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
