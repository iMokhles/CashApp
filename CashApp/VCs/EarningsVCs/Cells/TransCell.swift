//
//  TransCell.swift
//  CashApp
//
//  Created by iMokhles on 11/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift
import SDWebImage

class TransCell: UITableViewCell {
    
    @IBOutlet var transTitle: UILabel!
    @IBOutlet var transDate: UILabel!
    @IBOutlet var transPrice: UILabel!
    @IBOutlet var transIcon: UIImageView!
    @IBOutlet var transStatusView: UIView!
    @IBOutlet var transStatusLabel: UILabel!

    public func configureCell(withTrans trans:CATrans) {
        
        initTheme()
        
        transTitle.text = trans.ad?.title
        transDate.text = trans.createdAt?.toString(dateFormat: "dd-MMM-yyyy")
        transPrice.text = String(format: "%.2f$", (trans.ad?.price)!)
        transIcon.sd_setImage(with: URL(string: (trans.ad?.icon)!), placeholderImage: UIImage(named: "placeHolder"))
        
        if (trans.status == 1) {
            // pending
            transStatusView.backgroundColor = UIColor.warningColor()
            transStatusLabel.text = "Pending"
        } else if (trans.status == 2) {
            //completed
            transStatusView.backgroundColor = UIColor.successColor()
            transStatusLabel.text = "Completed"
        } else if (trans.status == 3) {
            // rejected
            transStatusView.backgroundColor = UIColor.dangerColor()
            transStatusLabel.text = "Rejected"
        }
    }
    
    fileprivate func initTheme() {
        
        self.transIcon.layer.cornerRadius = self.transIcon.frame.width/2.0
        self.transIcon.clipsToBounds = true
    }
}
