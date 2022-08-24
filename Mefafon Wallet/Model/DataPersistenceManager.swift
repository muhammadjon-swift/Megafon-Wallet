//
//  DataPersistenceManager.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/24/22.
//

import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    
    func downloadItemsWith(model: ItemsCollectionViewCellViewModel, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = LocalItem(context: context)
        
        item.title = model.description
        item.imagePath = model.imageURL
        
        do {
            try context.save()
            //        Note: The uniqueness is checked when you do managedObjectContext.save() not while you're just adding objects to the managed object.
            //
            //        NSMergeByPropertyObjectTrumpMergePolicy is just one of the merge policies, which overwrites the old value with the new one. You might want to check the documentation for other options.
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
    }
    
    
    func fetchingItemsFromDataBase(completion: @escaping (Result<[LocalItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<LocalItem>
        
        request = LocalItem.fetchRequest()
        
        do {
            
            let data = try context.fetch(request)
            completion(.success(data))
            //            // delete aall atrubute values in an Entity
            //            // Create Fetch Request
            //            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalItem")
            //
            //            // Create Batch Delete Request
            //            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            //
            //            do {
            //                try context.execute(batchDeleteRequest)
            //
            //            } catch {
            //                // Error Handling
            //            }
            
            
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    
    func deleteEveryThingInAtributes() {
        // delete aall atrubute values in an Entity
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalItem")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            
        } catch {
            // Error Handling
        }
    }
}
