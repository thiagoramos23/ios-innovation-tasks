//
//  CategoryData+CoreDataProperties.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 24/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryData> {
        return NSFetchRequest<CategoryData>(entityName: "CategoryData")
    }

    @NSManaged public var color: NSObject?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}
