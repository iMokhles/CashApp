//
//  MenuCell.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift



class MenuCell: UITableViewCell {
    
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellIcon: UIImageView!
    
    public func configureCell(withTitle title:String, icon:FontAwesomeSwift.FAType, color:UIColor) {
        
        cellTitle.text = title
        
        cellIcon.image = UIImage(icon: icon, size: CGSize(width: 25, height: 25), textColor: color)
        //setFAIconWithName(icon: icon, textColor: color)
        
    }
}
