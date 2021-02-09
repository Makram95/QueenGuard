//
//  AddApiaryView.swift
//  QueenGuard
//
//  Created by Marc on 08.02.21.
//

import SwiftUI

struct AddApiaryView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    var quarter = UIScreen.main.bounds.width/2
    @State var showAlert = false
    @State var saveDisabled = true
    @State var name = ""
    @State var regNr = ""
    @State var capacity = ""
    @State var lat = ""
    @State var long = ""
    @State var isActive = true
    
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                Form{
                    Section(header: Text("Basic Information")){
                        HStack{
                            Text("Name:")
                            Spacer()
                            TextField("Enter Name", text: $name, onEditingChanged: {_ in
                                checkInputsValid()
                            })
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: quarter)
                        }
                        HStack{
                            Text("Registration Nr.:")
                            Spacer()
                            TextField("Enter Nr:", text: $regNr, onEditingChanged: {_ in
                                checkInputsValid()
                            })
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: quarter)
                        }
                        HStack{
                            Text("Capacity:")
                            Spacer()
                            TextField("Capacity", text: $capacity, onEditingChanged: {_ in
                                checkInputsValid()
                            })
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: quarter)
                            .keyboardType(.numberPad)
                        }
                        
                        HStack{
                            Text("In use:")
                            Toggle("", isOn: $isActive)
                        }
                    }.onTapGesture {
                        hideKeyBoard()
                    }
                    
                    Section(header: Text("Location"), footer: Text("Only enter decimal numbers")) {
                        HStack{
                            Text("X-Coordinate:")
                            Spacer()
                            TextField("X", text: $lat, onEditingChanged: {_ in
                                checkInputsValid()
                            })
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: quarter)
                            .keyboardType(.decimalPad)
                        }
                        HStack{
                            Text("Y-Coordinate:")
                            Spacer()
                            TextField("Y", text: $long, onEditingChanged: {_ in
                                checkInputsValid()
                            })
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: quarter)
                            .keyboardType(.decimalPad)
                        }
                    }.onTapGesture {
                        hideKeyBoard()
                    }
                    
                    Section(footer: Text("Fields must not be empty and numbers must be valid to save.")){
                        Button(action: {
                            let apiary = Apiary(context: managedObjectContext)
                            apiary.name = name
                            apiary.creationDate = Date()
                            apiary.lastChangeDate = Date()
                            apiary.id = UUID().uuidString
                            apiary.capacity = Int16(Int(capacity)!)
                            apiary.isActive = isActive
                            apiary.lat = Double(lat)!
                            apiary.long = Double(long)!
                            apiary.registrationNumber = regNr
                            
                            dataController.save()
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Save")
                        }).disabled(saveDisabled)
                        
                        Button(action: {
                            showAlert.toggle()
                        }, label: {
                            Text("Cancel")
                        })
                    }
                }
            }.navigationTitle("New Apiary")
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Progress not saved!"), message: Text("You will lose all progress if you leave."), primaryButton: .destructive(Text("Leave anyway"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                , secondaryButton: .cancel(Text("Close")))
            }
            
        }
    }
    func checkInputsValid(){
        if !lat.isNumeric || !long.isNumeric || !capacity.isNumeric || name.isEmpty || regNr.isEmpty || (Int(capacity) ?? -1 < 0){
            saveDisabled = true
        }else{
            saveDisabled = false
        }
    }
    func hideKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddApiaryView_Previews: PreviewProvider {
    static var previews: some View {
        AddApiaryView()
    }
}
