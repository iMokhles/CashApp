//
//  CARank+CoreDataProperties.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//
//

import Foundation
import CoreData


extension CARank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CARank> {
        return NSFetchRequest<CARank>(entityName: "CARank")
    }

    @NSManaged public var id: Int64
    @NSManaged public var rank: Int64
    @NSManaged public var date: NSDate?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var profile: CAProfile?

}
