//
//  ApiaryListItem.swift
//  QueenGuard
//
//  Created by Marc on 09.02.21.
//

import SwiftUI

struct ApiaryListItem: View {
    var apiary: Apiary
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(apiary.apiaryName)
                    .font(.title)
                    .bold()
            }
            HStack{
                Text("Registration Nr.:")
                    .font(.headline)
                Text(apiary.apiaryRegistrationNumber)
                    
            }
            HStack{
                Text("Last changed: ")
                    .font(.headline)
                Text(createMediumDateString(date: apiary.apiaryLastChangeDate))
            }
            HStack{
            Text("Capacity:")
                .font(.headline)
                Text("\(apiary.apiaryHiveCount)/\(apiary.capacity)")
            }
    
            ProgressView(value: Double(apiary.apiaryHiveCount / Int(apiary.capacity)))
                .padding(.horizontal)
            
        }.padding()
        .background(Color.secondarySystemGroupedBackground)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(15)
        .shadow(radius: 1)
        
        
        
        
    }
}

struct ApiaryListItem_Previews: PreviewProvider {
    static var previews: some View {
        ApiaryListItem(apiary: Apiary.example)
            .makeSmallPreview()
    }
}
