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
    
    
    private var coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
        
    func getCategories() -> [Category] {
        var categories: [Category] = []
        let categoriesData = self.coreDataStack.list(entityName: "CategoryData") as! [CategoryData]
        for categoryData in categoriesData {
            let category = Category(id: categoryData.id!, name: categoryData.name!, color: categoryData.color as! UIColor)
            categories.append(category)
        }
        
        return categories
    }
    
    func getCategoryDataByName(name: String) -> CategoryData {
        return self.coreDataStack.getByValue(entityName: "CategoryData", field: "name", value: name)
    }
    
    func getCategoryByName(name: String) -> Category {
        let categoryData: CategoryData = getCategoryDataByName(name: name)
        return Category(id: categoryData.id!, name: categoryData.name!, color: categoryData.color as! UIColor)
    }
}
