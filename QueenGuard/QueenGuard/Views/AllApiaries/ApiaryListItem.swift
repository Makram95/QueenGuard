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
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.accentColor)
            }
            HStack{
                Text("Registration Nr.:")
                    .font(.headline)
                Text(apiary.apiaryRegistrationNumber)
                    
            }
            HStack{
                Text("Last changed:")
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
        .shadow(color: .accentColor, radius: 0.5)
        .shadow(color: .accentColor, radius: 0.5)
        .shadow(color: .accentColor, radius: 0.5)
        
        
        
        
    }
}

struct ApiaryListItem_Previews: PreviewProvider {
    static var previews: some View {
        ApiaryListItem(apiary: Apiary.example)
            .makeSmallPreview()
    }
}
