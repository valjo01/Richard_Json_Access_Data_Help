//
//  CoreDataService.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 31.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {
    
    // MARK:-- Singleton Pattern
    static let defaults = CoreDataService()
    
    // MARK:-- Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK:-- Init
    // private = only usable within the same class
    private init() { }

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Richard_Help_Access_Json_Data")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
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
    
    // MARK: -- CRUD = create, read, update, delete
    // create
    func createUserQuestionOnBtnTapped (_frage:String, _antwort1:String) -> QuestionsCoreData {
        let question = QuestionsCoreData(context: context)
        question.frage = _frage
        question.antwort1 = _antwort1
        
        saveContext()
        
        return question
    }
    
    // read
    func loadData() -> [QuestionsCoreData]? {
        let fetchRequest: NSFetchRequest<QuestionsCoreData> = QuestionsCoreData.fetchRequest() // Nur die Anfrage
        
        do {
            let resultArray = try context.fetch(fetchRequest)
            return resultArray
        } catch  {
            print("Fehler beim laden der Daten", error.localizedDescription)
        }
        
        return nil
    }
    
    // update
    
    // delete
    
    
}
    
    

