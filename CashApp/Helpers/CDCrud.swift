//
//  CDCrud.swift
//  CashApp
//
//  Created by iMokhles on 07/01/2018.
//  Copyright © 2018 iMokhles. All rights reserved.
//

import Foundation
import CoreData


open class CDCrud {

    fileprivate var modelName = ""

    static var sharedCrud: CDCrud = {
        let shared = CDCrud()
        return shared
    }()
    
    public func setContainerName(name:String) {
        self.modelName = name
    }
    
    // MARK: - Core Data stack
    
    fileprivate lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - CRUD
    
    // MARK: - Create
    public func createNewObject(entityName: String) -> NSManagedObject {
        let context = persistentContainer.viewContext
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
    }
    public func createNewObjectWithProperties(entityName: String, properties: [AnyHashable : Any]) -> NSManagedObject? {
        
        let object = createNewObject(entityName: entityName)
        for (key, value) in properties {
            object.setValue(value, forKey: key as! String)
        }
        saveContext()
        return object
    }
    // MARK: - Read
    public func readObject(entityName: String, id:Int) -> NSManagedObject? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.first as? NSManagedObject
            
        } catch {
            print("Failed to fetch object:", error)
            return nil
        }
    }
    public func readAllObjects(entityName: String) -> [NSManagedObject]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let objects = try context.fetch(fetchRequest)
            return objects as? [NSManagedObject]
            
        } catch {
            print("Failed to fetch objects:", error)
            return nil
        }
    }
    // MARK: - Update
    public func updateObjectWithId(entityName: String, id:Int, properties: [AnyHashable : Any]) {
        let object = readObject(entityName: entityName, id: id)
        for (key, value) in properties {
            object?.setValue(value, forKey: key as! String)
        }
        
        saveContext()
    }
    // MARK: - Delete
    public func deleteObject(_ object: NSManagedObject){
        let context = persistentContainer.viewContext
        context.delete(object)
    }
    public func deleteAllObjects(entityName: String) {
        let objcts = readAllObjects(entityName: entityName)
        for object in objcts! {
            deleteObject(object)
        }
    }
    
    // MARK: - Operations
    public func readReleationObjectWhereIdEqual(entityName: String, relatedName:String, id:Int) -> NSManagedObject? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%@.id == %d", relatedName, id)
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.first as? NSManagedObject
            
        } catch {
            print("Failed to fetch object:", error)
            return nil
        }
    }
    public func readReleationObjectWhere(entityName: String, relatedName:String, propertyName:String, propertyValue:String) -> NSManagedObject? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%@.%@ == %@", relatedName, propertyName, propertyValue)
        do {
            let objects = try context.fetch(fetchRequest)
            return objects.first as? NSManagedObject
            
        } catch {
            print("Failed to fetch object:", error)
            return nil
        }
    }
    
    
    
}
