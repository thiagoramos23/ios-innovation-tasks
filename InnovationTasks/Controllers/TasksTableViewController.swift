//
//  TasksTableViewController.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 05/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    private var dateFormatter: DateFormatter = DateFormatter()
    
    private var tasks: [Task] = []
    
    private var taskRepository: TaskRepository = TaskRepository.instance

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tasks = taskRepository.getTasks()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        
        dateFormatter.dateFormat = "HH:mm"
        cell.hourLabel.text = dateFormatter.string(from: task.date)
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.dateLabel.text = dateFormatter.string(from: task.date)
        
        cell.cagtegoryNameLabel.text = task.category.name
        cell.categoryView.backgroundColor = task.category.color as? UIColor
        cell.taskDescriptionLabel.text = task.name
        
        return cell
    }

}
