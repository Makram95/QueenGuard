//
//  AllApiariesView.swift
//  QueenGuard
//
//  Created by Marc on 01.02.21.
//

import SwiftUI

struct AllApiariesView: View {
    
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var showAddModal = false
    var apiaries: FetchRequest<Apiary>
    
    init() {
        apiaries = FetchRequest<Apiary>(
            entity: Apiary.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Apiary.name, ascending: false)]
        )
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach(apiaries.wrappedValue){ apiary in
                        NavigationLink(destination: ApiaryView(apiary: apiary)) {
                            ApiaryListItem(apiary: apiary)
                                .padding([.horizontal,.top])
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Button("Add New Apiary") {
                        showAddModal.toggle()
                    }.padding()
                    .background(Color.secondarySystemGroupedBackground)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(15)
                    .shadow(color: .accentColor, radius: 0.5)
                    .shadow(color: .accentColor, radius: 0.5)
                    .shadow(color: .accentColor, radius: 0.5)
                }.padding()
                .sheet(isPresented: $showAddModal, content: {
                    AddApiaryView()
                })
            }.navigationTitle("Apiaries")
            .background(Color.systemGroupedBackground.ignoresSafeArea())
        }
    }
}


struct AllApiariesView_Previews: PreviewProvider {
    static var previews: some View {
        AllApiariesView()
    }
}


