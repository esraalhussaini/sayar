//
//  AddFuel View.swift
//  sayar
//
//  Created by Razan Altamimi on 08/11/1443 AH.
//

import SwiftUI

enum FocusTextOil {
    case cost, Kilometer, oilcompany
}
struct AddOilView: View {
    
    @FocusState private var focusField: FocusTextOil?

    @State private var isShowingDialog = false
    @State private var selected = 0
    @EnvironmentObject  var vm : OilViewModel
    var oilType = ["3","5", "8", "10", "15",]


        
        
        @Binding var isPresented: Bool

        
        var body: some View {

            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
                 
                    VStack(alignment: .center , spacing: 10){

                        
                        Form{
                 
                    
                        Section{
                            
                            DatePicker("Pick a date", selection: $vm.date, displayedComponents: .date)
                           // TextField("Make", text:$titel)
                           // TextField("Model", text: $post )
                            
                        }
                        
                            
                                Section{
                                    TextField(LocalizedStringKey("SAR"), text:$vm.costString)
                                        .focused($focusField, equals: .cost)
                                        .keyboardType(.numberPad)
                                        
                                    
                                }
                            
                            
                            Section{
                                TextField(LocalizedStringKey("km"), text:$vm.kmString)
                                    .focused($focusField, equals: .Kilometer)
                                    .keyboardType(.numberPad)
                                   
                                
                            }
                            
                            Section{
//Text("The Oil Type")
                                Picker("the Oil Type", selection: $vm.oilType) {
                                                    ForEach(oilType, id: \.self) {
                                                        Text($0)
                                                    }
                               }.pickerStyle(.segmented)
                                

//                                TextField("oil Type", text:$vm.oilType)
//                                    .keyboardType(.twitter)
                                Section{
                                TextField(LocalizedStringKey("OilCompany"), text:$vm.oilCompany)
                                        .focused($focusField, equals: .oilcompany)
                                                          .keyboardType(.twitter)
                                    

                              
                                        
                                
                            }
                            
                            
                        }
                            
//
              }//form
                        
 
                         
                    
                 
                    }//VSTACK IMAGE
                 
                    VStack{
                        Spacer()
                        nextView()
//                            .background(Color.red)
                            .frame( height: 50 )
//                            .ignoresSafeArea( .keyboard, edges: .bottom )
                    }
                }//zstack importent

                
                
                
                
   

                .navigationBarTitle("Add Oil", displayMode: .inline)
          .navigationBarItems(leading:leading   ,trailing: trailing)
               
                    
//          .ignoresSafeArea(.all, edges: .bottom)
          .alert(item: $vm.appError) { alert in
              Alert(title: Text(""), message: Text("\(alert.localizedDescription)"))
          }
                    
            }//NavgationView
            .onDisappear(){
                vm.clearState()
            }
        }//varBody1
    
    
@ViewBuilder
    func nextView()-> some View {
        if let focusField = focusField{
            HStack{
                Spacer()
                Button(action: {
                    switch focusField {
                    case .cost:
                        self.focusField = .Kilometer
                    case .Kilometer:
                        self.focusField = .oilcompany
                    case .oilcompany:
                        self.focusField = nil
                    }
                }, label:{
                    Text(focusField == .oilcompany ? "Done" : "Next")
                })
                       }}}
    
    
        
        
       //Cancel
        var leading: some View {

            Button(action : {
                isPresented.toggle()
            }, label: {
                Text("Cancel")
                    .accentColor(.red)
            })



        }//VarBody2


    //Done
        var trailing: some View {

            Button(action : {
                vm.uploadOil{}
               isPresented.toggle()
                
                
//                
//
//                notify.sendNotification(
//                    date:selectedDate,
//                    type: "date",
//                    title: "Date based notification",
//                    body: "This notification is a reminder that you added a date. Tap on the notification to see more.")
                
                
                
            }, label: {
                Text("Add")
                    .accentColor(.blue)
             
            })
            .disabled(vm.costString.isEmpty || vm.kmString.isEmpty || vm.oilType.isEmpty )


        }//VarBody3
}//StructView

//struct AddOilView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddOilView()
////
//
//    }
//}
