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
    
    private var dataTask: CoreDataStack
    
    init(dataTask: CoreDataStack) {
        self.dataTask = dataTask
    }
    
    func getCategoryDataByName(name: String) -> CategoryData {
        return self.dataTask.getByValue(entityName: "CategoryData", field: "name", value: name)
    }
    
    func getCategories() -> [Category] {
        var categories: [Category] = []
        let dataCategories = self.dataTask.list(entityName: "CategoryData") as! [CategoryData]
        for categoryData in dataCategories {
            var category = Category(id: categoryData.id!, name: categoryData.name!, color: categoryData.color as! UIColor)
            categories.append(category)
        }
        return categories
    }
}
