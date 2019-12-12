//
//  TaskRepository.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 10/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

class TaskRepository {
    
    private var coreDataStack: CoreDataStack
    private var categoryRepository: CategoryRepository
        
    init(coreDataStack: CoreDataStack, categoryRepository: CategoryRepository) {
        self.coreDataStack = coreDataStack
        self.categoryRepository = categoryRepository
    }
            
    func save(task: Task) {
        let taskData: TaskData   = TaskData(context: self.coreDataStack.context)
        taskData.id              = UUID()
        taskData.taskDescription = task.name
        taskData.date            = task.date
        taskData.category        = self.categoryRepository.getCategoryDataByName(name: task.category.name)
        self.coreDataStack.save()
    }
    
    func update(taskToUpdate: Task) {
    }
    
    func getTasks() -> [Task] {
        var tasks: [Task] = []
        let tasksData = self.coreDataStack.list(entityName: "TaskData") as! [TaskData]
        
        for taskData in tasksData {
            tasks.append(convertDatatoTask(taskData: taskData))
        }
        
        return tasks
    }
    
    private func convertDatatoTask(taskData: TaskData) -> Task {
        let category = self.categoryRepository.getCategoryByName(name: taskData.category!.name!)
        return Task(id: taskData.id!, name: taskData.taskDescription!, date: taskData.date!, category: category)
    }

}

