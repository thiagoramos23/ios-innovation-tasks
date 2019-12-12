//
//  TaskData+CoreDataProperties.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 12/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//
//

import Foundation
import CoreData


extension TaskData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskData> {
        return NSFetchRequest<TaskData>(entityName: "TaskData")
    }

    
    @NSManaged public var id: UUID?
    @NSManaged public var taskDescription: String?
    @NSManaged public var date: Date?
    @NSManaged public var category: CategoryData?

}
