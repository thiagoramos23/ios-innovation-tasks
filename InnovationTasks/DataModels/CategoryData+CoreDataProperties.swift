//
//  CategoryData+CoreDataProperties.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 12/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryData> {
        return NSFetchRequest<CategoryData>(entityName: "CategoryData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var color: NSObject?
    @NSManaged public var tasks: [TaskData]?

}
