//
//  CAProfile+CoreDataProperties.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//
//

import Foundation
import CoreData


extension CAProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CAProfile> {
        return NSFetchRequest<CAProfile>(entityName: "CAProfile")
    }

    @NSManaged public var id: Int64
    @NSManaged public var avatar: String?
    @NSManaged public var balance: Double
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var user: CAUser?

}
