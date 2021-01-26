//
//  DataController.swift
//  QueenGuard
//
//  Created by Marc on 26.01.21.
//

import SwiftUI
import CoreData

class DataController: ObservableObject{
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentCloudKitContainer(name: "Main") //main is name of Model-file
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores{storeDescription, error in
            if let error = error{
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        
        do{
            try dataController.createSampleDate()
        }catch{
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }
        return dataController
    }()
    
    func createSampleDate() throws {
        let viewContext = container.viewContext //pool of data that is loaded from disc and active right now
        
        for i in 1...5{
            let apiary = Apiary(context: viewContext)
            apiary.id = UUID()
            apiary.creationDate = Date()
            apiary.isActive = Bool.random()
            apiary.capacity = Int16.random(in:1...10)
            apiary.lastChangeDate = Date()
            apiary.name = "Apiary \(i)"
            apiary.xCoordinate = 0.00
            apiary.yCoordinate = 0.000
            apiary.registrationNumber = "testRegNR"
            
            for j in 1...10{
                let hive = Hive(context: viewContext)
                hive.creationDate = Date()
                hive.hiveType = "TestType"
                hive.id = UUID()
                hive.isAlive = Bool.random()
                hive.name = "Hive \(j)"
                hive.isWintered = Bool.random()
                hive.lastChangeDate = Date()
                hive.apiary = apiary
            }
        }
        try viewContext.save()
    }
    
    func save(){
        if container.viewContext.hasChanges{
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject){
        container.viewContext.delete(object)
    }
    func deleteAll(){
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = Hive.fetchRequest()
        let batchDeletRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeletRequest1)
        
        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Apiary.fetchRequest()
        let batchDeletRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeletRequest2)
    }
    
    func count<T>(for fetchRequest: NSFetchRequest<T>)->Int{
        (try? container.viewContext.count(for: fetchRequest)) ?? 0
    }
    
}
