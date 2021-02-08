//
//  DummyDataButtonView.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import SwiftUI

struct DummyDataButtonView: View {
    
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationView{
            VStack{
         Button("Add Data") {
            dataController.deleteAll()
            try? dataController.createSampleDate()
            dataController.save()
         }
        Button("Delete Data") {
           dataController.deleteAll()
            fatalError()
        }
            }
        }
    }
}

struct DummyDataButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DummyDataButtonView()
    }
}
