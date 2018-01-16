//
//  CAUser+CoreDataProperties.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//
//

import Foundation
import CoreData


extension CAUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CAUser> {
        return NSFetchRequest<CAUser>(entityName: "CAUser")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?

}
