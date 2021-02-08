//
//  HiveExtension.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import Foundation

extension Hive{
    
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
