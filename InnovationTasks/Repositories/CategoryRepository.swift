//
//  CategoryRepository.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 10/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import UIKit

class CategoryRepository {
    var categories: [Category]
    
    static var instance: CategoryRepository = CategoryRepository()
    
    private init() {
        self.categories = []
    }
        
    func getCategories() -> [Category] {
        let marketing = Category(id: UUID(), name: "Marketing", color: UIColor.black)
        let groceries = Category(id: UUID(), name: "Groceries", color: UIColor.blue)
        let work = Category(id: UUID(), name: "Work", color: UIColor.green)
        self.categories.append(marketing)
        self.categories.append(groceries)
        self.categories.append(work)
        return self.categories
    }
}
