//
//  TaskRepository.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 10/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

class TaskRepository {
    private var tasks: [Task] = []
    
    static var instance: TaskRepository = TaskRepository()
    
    private init() {
        self.tasks = []
    }
            
    func save(task: Task) {
        self.tasks.append(task)
    }
    
    func update(taskToUpdate: Task) {
    }
    
    func getTasks() -> [Task] {
        return tasks
    }
}

