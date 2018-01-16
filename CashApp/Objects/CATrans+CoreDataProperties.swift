//
//  CATrans+CoreDataProperties.swift
//  
//
//  Created by iMokhles on 11/01/2018.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CATrans {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CATrans> {
        return NSFetchRequest<CATrans>(entityName: "CATrans")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: Int64
    @NSManaged public var status: Int64
    @NSManaged public var updatedAt: Date?
    @NSManaged public var ad: CAAd?
    @NSManaged public var user: CAUser?

}
