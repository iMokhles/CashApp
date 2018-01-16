//
//  AACoreData.swift
//  AA-Creations
//
//  Created by Engr. Ahsan Ali on 20/12/2016.
//  Copyright © 2016 AA-Creations. All rights reserved.
//

import Foundation
import CoreData

open class AACoreData {
    
    open class func sharedInstance() -> AACoreData {
        
        struct Static {
            static let instance = AACoreData()
        }
        return Static.instance
    }
    
    open var dataModel = "AACoreData"
    
    private lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: self.dataModel, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("\(self.dataModel).sqlite")
        var failureReason = "AACoreData - There was an error creating or loading the application's saved data."
        do {
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true ]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "AACoreData - Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("AACoreData - Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    open lazy var managedObjectContext: NSManagedObjectContext = {
        
        var managedObjectContext: NSManagedObjectContext?
        if #available(iOS 10.0, *){
            managedObjectContext = self.persistentContainer.viewContext
        }
        else{
            let coordinator = self.persistentStoreCoordinator
            managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedObjectContext?.persistentStoreCoordinator = coordinator
            
        }
        return managedObjectContext!
    }()
    // iOS-10
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.dataModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("AACoreData - Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // MARK: - Core Data Saving support
    
    open func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("AACoreData - Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    

}

// MARK:- AACoreData Entities
open class AACoreDataEntity<String>: AACoreData {
    open let _entity: String
    
    public init(_ entity: String) {
        self._entity = entity
        super.init()
    }
}

// MARK:- AACoreData Wrapper


extension AACoreData {
    
    open func getNewObject(entityName: AACoreDataEntity<String>) -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName._entity, into: managedObjectContext)
        
    }
    open func fetchRecords(entityName: AACoreDataEntity<String>, predicate: String? = nil, sortDescriptors: [NSSortDescriptor]? = nil, completion: @escaping (_ records: Any?) -> ()) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName._entity)
        
        if let string = predicate {
            fetchRequest.predicate = NSPredicate(format: string)
        }
        
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            if result.count > 0 {
                completion(result)
            }
            else {
                completion(nil)
            }
        } catch let error as NSError {
            print("AACoreData - Fetch failed: \(error.localizedDescription)")
        }
    }
    
    open func deleteRecord(_ object: NSManagedObject){
         managedObjectContext.delete(object)
    }
    
    open func deleteAllRecords(entity: AACoreDataEntity<String>)
    {
        if #available(iOS 9.0, *) {
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: entity._entity)
            let batchReq = NSBatchDeleteRequest(fetchRequest: req)
            execute(batchReq)
        }
        else {
            fetchRecords(entityName: entity, completion: { (results) in
                if let records = results as? [NSManagedObject] {
                    for record in records {
                        self.deleteRecord(record)
                    }
                }
                else {
                    print("AACoreData - No records found to delete")
                }
            })
            
        }
    }
    
    open func updateRecords(entity: AACoreDataEntity<String>, properties: [AnyHashable : Any]) {
        
        let batchRequest = NSBatchUpdateRequest(entityName: entity._entity)
        batchRequest.propertiesToUpdate = properties
        batchRequest.resultType = .updatedObjectsCountResultType
        execute(batchRequest)
        
    }
    
    open func execute(_ request: NSPersistentStoreRequest) {
        do {
            try managedObjectContext.execute(request)
        }
        catch {
            print(error)
        }
    }
    
}
