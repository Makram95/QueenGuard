//
//  HivesListItem.swift
//  QueenGuard
//
//  Created by Marc on 10.02.21.
//

import SwiftUI

struct HivesListItem: View {
    var hive: Hive
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(hive.hiveName)
                    .font(.title)
                    .bold()
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.accentColor)
            }
            HStack{
                Text("Type:")
                    .font(.headline)
                Text(hive.hiveType)
                    
            }
            HStack{
                Text("Last changed:")
                    .font(.headline)
                Text(createMediumDateString(date: hive.hiveLastChangeDate))
            }
            HStack{
            Text("Status:")
                .font(.headline)
                Spacer()
                
                if hive.isWintered{
                    Image(systemName: "snow")
                }
                if hive.isAlive{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }else{
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.red)
                }
            }
    
            
            
        }.padding()
        .background(Color.secondarySystemGroupedBackground)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(15)
        .shadow(color: .accentColor, radius: 0.5)
        .shadow(color: .accentColor, radius: 0.5)
        .shadow(color: .accentColor, radius: 0.5)
    }
}

struct HivesListItem_Previews: PreviewProvider {
    static var previews: some View {
        HivesListItem(hive: Hive.example)
    }
}
