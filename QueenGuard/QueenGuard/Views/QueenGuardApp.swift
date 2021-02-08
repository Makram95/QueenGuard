//
//  QueenGuardApp.swift
//  QueenGuard
//
//  Created by Marc on 26.01.21.
//

import SwiftUI

@main
struct QueenGuardApp: App {
    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentViewIOS()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
            
        }
    }
}
