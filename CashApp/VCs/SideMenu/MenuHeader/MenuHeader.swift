//
//  MenuHeader.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MenuHeader: UIView {
    
    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    
    public func configureHeader(withName nameString: String, subName:String, avatarUrl:String) {
        initTheme()
        self.topLabel.text = nameString
        self.bottomLabel.text = subName
        self.avatarView.sd_setImage(with: URL(string: avatarUrl), placeholderImage: UIImage(named: "placeHolder"))
        
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(withName nameString: String, subName:String, avatarUrl:String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 80))
        commonInit()
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    fileprivate func commonInit() {
        
    }
    fileprivate func initTheme() {
        
        self.avatarView.layer.cornerRadius = self.avatarView.frame.width/2.0
        self.avatarView.clipsToBounds = true
    }
    
}
