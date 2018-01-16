//
//  CAAd+CoreDataProperties.swift
//  CashApp
//
//  Created by iMokhles on 06/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//
//

import Foundation
import CoreData


extension CAAd {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CAAd> {
        return NSFetchRequest<CAAd>(entityName: "CAAd")
    }

    @NSManaged public var id: Int64
    @NSManaged public var price: Double
    @NSManaged public var rate: Double
    @NSManaged public var title: String
    @NSManaged public var icon: String
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?

}
