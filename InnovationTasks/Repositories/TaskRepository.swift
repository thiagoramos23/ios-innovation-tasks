//
//  TaskRepository.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 10/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

class TaskRepository {
    private var dataStack: CoreDataStack
        
    init(dataStack: CoreDataStack) {
        self.dataStack = dataStack
    }
    
    func save(task: Task) {
        let taskData = TaskData(context: self.dataStack.context)
        taskData.taskDescription = task.name
        taskData.date = task.date
        
        let categoryData = CategoryData(context: self.dataStack.context)
        categoryData.name = task.category.name
        categoryData.color = task.category.color
        taskData.category = categoryData
        self.dataStack.save()
    }
    
    func update(taskToUpdate: Task) {
    }
    
    func getTasks() -> [TaskData] {
        self.dataStack.list(entityName: "TaskData") as! [TaskData]
    }
}

