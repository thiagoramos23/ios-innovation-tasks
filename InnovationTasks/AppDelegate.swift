//
//  AppDelegate.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 05/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var coreDataStack: CoreDataStack = CoreDataStack()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        createCategoriesIfDontExist()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func createCategoriesIfDontExist() {
        let categories = coreDataStack.list(entityName: "CategoryData")
        if categories.isEmpty {
            createCategories()
        }
    }
    
    func createCategories() {
        let colorWithNames: [String:UIColor] = ["Marketing": .black, "Study": .blue, "Food": .green]
        for (name, color) in colorWithNames {
            let category = CategoryData(context: self.coreDataStack.context)
            category.id    = UUID()
            category.name  = name
            category.color = color
            
            self.coreDataStack.save()
        }
    }
}

