//
//  CoreData.swift
//  ToDoListUIkit
//
//  Created by mac on 7/13/25.
//
import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    lazy var managedContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "ToDoList")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
        
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()


        func saveContext () {
            if managedContext.hasChanges {
                do {
                    try managedContext.save()
                } catch {
                    
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    
}
