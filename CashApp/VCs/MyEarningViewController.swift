//
//  MyEarningViewController.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import FontAwesomeSwift
import InteractiveSideMenu
import Segmentio

class MyEarningViewController: UIViewController, SideMenuItemContent {
    
    @IBOutlet var segmentioView: CASegmentio!

    @IBOutlet var scontentView1: UIView!
    @IBOutlet var scontentView2: UIView!
    @IBOutlet var scontentView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "My Earning"
        
        FunctionsHelper.sharedManager.addLeftButtonBar(vc: self, icon: .FABars) { (btn) in
            if let navigationViewController = self.navigationController as? SideMenuItemContent {
                navigationViewController.showSideMenu()
            }
        }
        
        configureSegment()
    }
    
    fileprivate func configureSegment() {
        var content = [SegmentioItem]()
        
        let transactionsItem = SegmentioItem(
            title: "Transactions",
            image: UIImage()
        )
        let withdrawItem = SegmentioItem(
            title: "Withdraw Money",
            image: UIImage()
        )
        let payoutItem = SegmentioItem(
            title: "Payout History",
            image: UIImage()
        )
        content.append(transactionsItem)
        content.append(withdrawItem)
        content.append(payoutItem)

        SegmentioBuilder.buildSegmentioView(
            segmentioView: segmentioView,
            segmentioStyle: .onlyLabel,
            contents: content
        )
        
        segmentioView.selectedSegmentioIndex = selectedSegmentioIndex()
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in
            self?.changeContentView(index: segmentIndex)
        }
    }
    fileprivate func selectedSegmentioIndex() -> Int {
        return 0
    }
    fileprivate func changeContentView(index:Int) {
        switch index {
        case 0:
            showContentView1()
            break;
        case 1:
            showContentView2()
            break;
        case 2:
            showContentView3()
            break;
        default:
            return;
        }
    }
    fileprivate func showContentView1() {
        let transitionOptions: UIViewAnimationOptions = [.curveEaseInOut, .showHideTransitionViews]
        
        UIView.transition(with: scontentView2, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView2.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: scontentView3, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView3.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: scontentView1, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView1.isHidden = false
        }, completion: nil)
    }
    fileprivate func showContentView2() {
        let transitionOptions: UIViewAnimationOptions = [.curveEaseInOut, .showHideTransitionViews]
        
        UIView.transition(with: scontentView2, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView2.isHidden = false
        }, completion: nil)
        
        UIView.transition(with: scontentView3, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView3.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: scontentView1, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView1.isHidden = true
        }, completion: nil)
    }
    fileprivate func showContentView3() {
        let transitionOptions: UIViewAnimationOptions = [.curveEaseInOut, .showHideTransitionViews]
        
        UIView.transition(with: scontentView2, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView2.isHidden = true
        }, completion: nil)
        
        UIView.transition(with: scontentView3, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView3.isHidden = false
        }, completion: nil)
        
        UIView.transition(with: scontentView1, duration: 0.4, options: transitionOptions, animations: {
            self.scontentView1.isHidden = true
        }, completion: nil)
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
