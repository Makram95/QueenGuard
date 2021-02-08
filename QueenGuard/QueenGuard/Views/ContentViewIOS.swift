//
//  ContentView.swift
//  QueenGuard
//
//  Created by Marc on 26.01.21.
//

import SwiftUI

struct ContentViewIOS: View {
    var body: some View {
        TabView{
            MainOverview()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Overview")
                }
            
            AllApiariesView()
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("Apiaries")
                }
            
            DummyDataButtonView()
                .tabItem { Text("Dummy Data") }
        }
    }
}

struct ContentViewIOS_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewIOS()
    }
}
