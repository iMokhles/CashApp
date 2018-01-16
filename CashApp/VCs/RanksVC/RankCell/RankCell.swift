//
//  RankCell.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift
import SDWebImage

class RankCell: UITableViewCell {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var rankDate: UILabel!
    @IBOutlet var userBalance: UILabel!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var rankIcon: UIImageView!

    public func configureCell(withRank rank:CARank) {
        
        initTheme()
        
        userName.text = rank.profile?.user?.name
        rankDate.text = rank.date?.toString(dateFormat: "dd-MMM-yyyy")
        userBalance.text = String(format: "%.2f$", (rank.profile?.balance)!)
        userAvatar.sd_setImage(with: URL(string: (rank.profile?.avatar)!), placeholderImage: UIImage(named: "placeHolder"))
        
        if (rank.rank == 1) {
            rankIcon.image = UIImage(named: "gold-medal")
        } else if (rank.rank == 2) {
            rankIcon.image = UIImage(named: "silver-medal")
        } else if (rank.rank == 3) {
            rankIcon.image = UIImage(named: "bronze-medal")
        } else {
            rankIcon.image = UIImage(icon: FAType.FACircle, size: CGSize(width: 30, height: 30), textColor: .lightGray)
        }
    }
    
    fileprivate func initTheme() {
        
        self.userAvatar.layer.cornerRadius = self.userAvatar.frame.width/2.0
        self.userAvatar.clipsToBounds = true
    }
}
