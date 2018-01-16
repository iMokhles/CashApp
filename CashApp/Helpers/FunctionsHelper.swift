//
//  FunctionsHelper.swift
//  CashApp
//
//  Created by iMokhles on 05/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import UIKit
import FontAwesomeSwift

class FunctionsHelper {

    
    // MARK: Properties
    static var sharedManager: FunctionsHelper = {
        let manager = FunctionsHelper()
        return manager
    }()

    func addRightButtonBar(vc:UIViewController, icon: FontAwesomeSwift.FAType, completion: @escaping (UIBarButtonItem?) -> Void) -> Void {
        
        let rightBtn = UIBarButtonItem(title: "", style: .plain, { (btn) in
            completion(btn)
        })
        rightBtn.setFAIcon(icon: icon, iconSize: 20.0)
        vc.navigationItem.rightBarButtonItem = rightBtn
    }
    
    
    func addLeftButtonBar(vc:UIViewController, icon: FontAwesomeSwift.FAType, completion: @escaping (UIBarButtonItem?) -> Void) -> Void {
        
        let leftBtn = UIBarButtonItem(title: "", style: .plain, { (btn) in
            
            completion(btn)
        })
        leftBtn.setFAIcon(icon: icon, iconSize: 20.0)
        vc.navigationItem.leftBarButtonItem = leftBtn
    }
    
    func deleteDummyInfo() {
        CDCrud.sharedCrud.deleteAllObjects(entityName: "CAUser")
        CDCrud.sharedCrud.deleteAllObjects(entityName: "CAProfile")
        CDCrud.sharedCrud.deleteAllObjects(entityName: "CARank")
        CDCrud.sharedCrud.deleteAllObjects(entityName: "CAAd")
        CDCrud.sharedCrud.deleteAllObjects(entityName: "CATrans")
    }
    func createDummyInfo() {
        let usersList = [
            [
                "id": 1,
                "name": "Mokhlas Hussein",
                "email": "example@email.com",
                "password": "123456",
                "createdAt": Date(),
                "updatedAt": Date(),

            ],
            [
                "id": 2,
                "name": "Momo Account",
                "email": "momexample@email.com",
                "password": "123456",
                "createdAt": Date(),
                "updatedAt": Date(),
            ]
        ]
        
        for user in usersList {
           let _ = CDCrud.sharedCrud.createNewObjectWithProperties(entityName: "CAUser", properties: user)
        }
        
        
        let profilesList = [
            [
                "id": 1,
                "balance": 38.90,
                "avatar": "https://randomuser.me/api/portraits/men/55.jpg",
                "createdAt": Date(),
                "updatedAt": Date(),
                "user_id": 1

            ],
            [
                "id": 2,
                "balance": 21.20,
                "avatar": "https://randomuser.me/api/portraits/men/44.jpg",
                "createdAt": Date(),
                "updatedAt": Date(),
                "user_id": 2
            ]
        ]
        for profile in profilesList {
            let object = CDCrud.sharedCrud.createNewObject(entityName: "CAProfile")
            for (key, value) in profile {
                if (key == "user_id") {
                    let user = CDCrud.sharedCrud.readObject(entityName: "CAUser", id: value as! Int)
                    object.setValue(user, forKey: "user")
                } else {
                    object.setValue(value, forKey: key)
                }
            }
            CDCrud.sharedCrud.saveContext()
        }
        
        let ranksList = [
            [
                "id": 1,
                "rank": 1,
                "date": Date(),
                "createdAt": Date(),
                "updatedAt": Date(),
                "profile_id": 1
            ],
            [
                "id": 2,
                "rank": 2,
                "date": Date(),
                "createdAt": Date(),
                "updatedAt": Date(),
                "profile_id": 2
            ]
        ]
        
        for rank in ranksList {
            let object = CDCrud.sharedCrud.createNewObject(entityName: "CARank")
            for (key, value) in rank {
                if (key == "profile_id") {
                    let profile = CDCrud.sharedCrud.readObject(entityName: "CAProfile", id: value as! Int)
                    object.setValue(profile, forKey: "profile")
                } else {
                    object.setValue(value, forKey: key)
                }
            }
            CDCrud.sharedCrud.saveContext()
        }
        
        let adsList = [
            [
                "id": 1,
                "title": "Finish Registration",
                "price": 0.45,
                "rate": 4.48,
                "icon": "https://static.nationwide.com/static/BOP-dollarsign-icon.png?r=68",
                "createdAt": Date(),
                "updatedAt": Date(),

            ],
        ]

        for ad in adsList {
            let object = CDCrud.sharedCrud.createNewObject(entityName: "CAAd")
            for (key, value) in ad {
                object.setValue(value, forKey: key)
            }
            CDCrud.sharedCrud.saveContext()
        }

        let transList = [
            [
                "id": 1,
                "status": 1,
                "ad_id": 1,
                "user_id": 1,
                "createdAt": Date(),
                "updatedAt": Date(),

                ],
            ]

        for trans in transList {
            let object = CDCrud.sharedCrud.createNewObject(entityName: "CATrans")
            for (key, value) in trans {
                if (key == "user_id") {
                    let user = CDCrud.sharedCrud.readObject(entityName: "CAUser", id: value as! Int)
                    object.setValue(user, forKey: "user")
                } else if (key == "ad_id") {
                    let ad = CDCrud.sharedCrud.readObject(entityName: "CAAd", id: value as! Int)
                    object.setValue(ad, forKey: "ad")
                }else {
                    object.setValue(value, forKey: key)
                }
            }
            CDCrud.sharedCrud.saveContext()
        }
        
    }
    func getDemoUser() {
        
    }

}
