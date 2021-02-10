//
//  HiveExtension.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import Foundation

extension Hive{
    
    static var example: Hive  {
        let controller = DataController.preview
        let viewContext = controller.container.viewContext
        
        let hive = Hive(context: viewContext)
        hive.creationDate = Date()
        hive.name = "Test"
        hive.type = "Zander"
        hive.id = UUID().uuidString
        hive.isAlive = true
        hive.lastChangeDate = Date()
        hive.isWintered = false
        
        
        
        return hive
    }
    
    var hiveName: String{
        name ?? NSLocalizedString("New Hive", comment: "")
    }
    var hiveType: String{
        type ?? NSLocalizedString("Unknown", comment: "")
    }
    var hiveCreationDate: Date{
        creationDate ?? Date()
    }
    var hiveLastChangeDate: Date{
        lastChangeDate ?? Date()
    }
}
