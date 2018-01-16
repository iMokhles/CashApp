//
//  OfferCell.swift
//  CashApp
//
//  Created by iMokhles on 11/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift
import SDWebImage

class OfferCell: UITableViewCell {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var offerTitle: UILabel!
    @IBOutlet var offerIcon: UIImageView!
    @IBOutlet var offerPrice: UILabel!
    @IBOutlet var offerStars: CosmosView!
    @IBOutlet var submitEmailBtn: LGButton!
    @IBOutlet var detailsBtn: LGButton!
    
    public func configureCell(withOffer offer:CAAd) {
        
        initTheme()
        
        offerTitle.text = offer.title
        offerPrice.text = String(format: "%.2f$", (offer.price))
        offerStars.rating = offer.rate
        offerIcon.sd_setImage(with: URL(string: offer.icon), placeholderImage: UIImage(named: "placeHolder"))
        
        
    }
    
    fileprivate func initTheme() {
        
        self.offerIcon.layer.cornerRadius = self.offerIcon.frame.width/2.0
        self.offerIcon.clipsToBounds = true
        
        
        
    }
    
    @IBAction func emailButtonTapped(_ sender:LGButton) {
        
    }
    @IBAction func detailButtonTapped(_ sender:LGButton) {
        
    }
}
