//
//  ApiaryExtension.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import Foundation

extension Apiary {
    
    static var example: Apiary {
        let controller = DataController.preview
        let viewContext = controller.container.viewContext
        
        let apiary = Apiary(context: viewContext)
        
        apiary.name = "Example Apiary"
        apiary.id = "0"
        apiary.capacity = 0
        apiary.registrationNumber = "5352"
        apiary.lat = 2.12345
        apiary.long = 2.46543
        apiary.creationDate = Date()
        
        return apiary
    }
    
    
    var apiaryName: String {
        name ?? NSLocalizedString("New Apiary", comment: "Name of new Apiary")
    }
    
    var apiaryCreationDate: Date{
        creationDate ?? Date()
    }
    var apiaryLastChangeDate: Date{
        lastChangeDate ?? Date()
    }
    var apiaryRegistrationNumber: String{
        registrationNumber ?? NSLocalizedString("Unknown", comment: "")
    }
    var apiaryLocation: (Double,Double){
        (x:lat, y:long)
    }
    var apiaryHives: [Hive]{
        hives?.allObjects as? [Hive] ?? []
    }
    var apiaryHiveCount: Int{
        guard apiaryHives.isEmpty ==  false else{
            return 0
        }
        return apiaryHives.count
    }
}
