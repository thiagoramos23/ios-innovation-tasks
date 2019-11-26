//
//  TaskRepository.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 10/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import UIKit

class TaskRepository {
    private var dataStack: CoreDataStack
        
    init(dataStack: CoreDataStack) {
        self.dataStack = dataStack
    }
    
    func save(task: Task) {
        let taskData = TaskData(context: self.dataStack.context)
        taskData.id = UUID()
        taskData.taskDescription = task.name
        taskData.date = task.date
        taskData.category = convertToData(category: task.category)
        self.dataStack.save()
    }
    
    func update(taskToUpdate: Task) {
    }
    
    func getTasks() -> [Task] {
        let tasksData = self.dataStack.list(entityName: "TaskData") as! [TaskData]
        var tasks: [Task] = []
        for taskData in tasksData {
            let task = Task(id: taskData.id!, name: taskData.taskDescription!, date: taskData.date!, category: convertToCategory(categoryData: taskData.category!))
            tasks.append(task)
        }
        
        return tasks
    }
    
    private func convertToData(category: Category) -> CategoryData {
        let categoryData   = CategoryData(context: self.dataStack.context)
        categoryData.id    = category.id
        categoryData.name  = category.name
        categoryData.color = category.color
        return categoryData
    }
    
    private func convertToCategory(categoryData: CategoryData) -> Category {
        return Category(id: categoryData.id!, name: categoryData.name!, color: categoryData.color! as! UIColor)
    }
}

