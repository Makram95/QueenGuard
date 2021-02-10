//
//  ApiaryView.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import SwiftUI

struct ApiaryView: View {
    
    @ObservedObject var apiary: Apiary
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                Text("Hives")
                    .font(.title)
                    .bold()
                    .padding(.leading)
                ForEach(apiary.apiaryHives){hive in
                    NavigationLink(
                        destination: HiveView(hive:hive),
                        label: {
                            HivesListItem(hive: hive)
                                .padding([.horizontal])
                        }).buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationTitle(apiary.apiaryName)
        .background(Color.systemGroupedBackground.ignoresSafeArea())
    }
}

struct ApiaryView_Previews: PreviewProvider {
    static var previews: some View {
        ApiaryView(apiary: Apiary.example)
    }
}
