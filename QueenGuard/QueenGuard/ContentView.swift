//
//  ContentView.swift
//  QueenGuard
//
//  Created by Marc on 26.01.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("🍯🐝💨")
                .font(.system(size: 100))
                .padding()
            Text("Great things coming soon...")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .background(Color("AccentColor")).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
