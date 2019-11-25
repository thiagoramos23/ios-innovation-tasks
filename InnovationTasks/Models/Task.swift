//
//  Task.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 07/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

struct Task {
    var id = UUID()
    var name: String = ""
    var date: Date = Date()
    var category: Category = Category(name: "Marketing", color: .black)
}
