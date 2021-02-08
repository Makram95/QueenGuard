//
//  MainOverview.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import SwiftUI

struct MainOverview: View {
    
    var body: some View {
        NavigationView{
            Text("Hello, World!")
                .navigationTitle("Overview")
        }
    }
}

struct MainOverview_Previews: PreviewProvider {
    static var previews: some View {
        MainOverview()
    }
}
