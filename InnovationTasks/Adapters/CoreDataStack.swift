//
//  CoreDataStack.swift
//  InnovationTasks
//
//  Created by Thiago Ramos on 24/11/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentCloudKitContainer(name: "InnovationTasks")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("###\(#function): Failed to load persistent stores:\(error)")
        })

        return container
    }()
    
    lazy var context: NSManagedObjectContext =  {
        return self.persistentContainer.viewContext
    }()
    
    func list<T: NSManagedObject>(entityName: String) -> [T] {
        let fetchRequest = NSFetchRequest<T>.init(entityName: entityName)
        return try! persistentContainer.viewContext.fetch(fetchRequest)
    }
    
    func getByValue<T: NSManagedObject>(entityName: String, field: String, value: String) -> T {
        let fetchRequest = NSFetchRequest<T>.init(entityName: entityName)
        let predicate = NSPredicate(format: "%K = %@", field, value)
        fetchRequest.predicate = predicate
        return try! context.fetch(fetchRequest).first!
    }
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
