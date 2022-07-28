//
//  AddBatteryView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI
enum FocusTextBattery {
    case cost, Kilometer, batteryCompany
}
struct AddBatteryView: View {
    
    @State private var isShowingDialog = false
    @FocusState private var focusField: FocusTextBattery?
//    @StateObject var vm = BatteryViewModel()
    @EnvironmentObject  var vm : BatteryViewModel
//Pluse button
    
    
        
        
        @Binding var isPresented: Bool

//    @Binding var  DATE: Date
     // @Binding var  DATE = Date()
//    @Binding var cost : String
//    @Binding var BatteryYearRelease  : String
////
//    @Binding var ExpectedTime: String
 
        var body: some View {
            
            
            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
                 
                    VStack(alignment: .center , spacing: 10){
    //                       Spacer()
    //                        Image("DefualtCar")
    //                //button
    //                        Text("Add Photo")
                
                        
                        
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
                                    
                                    TextField(LocalizedStringKey("Km"), text:$vm.kmString)
                                        .focused($focusField, equals: .Kilometer)
                                        .keyboardType(.numberPad)
                                    
                                }
                            Section{
                                TextField(LocalizedStringKey("BatteryComapany"), text:$vm.batteryComp)
                                    .focused($focusField, equals: .batteryCompany)
                                    .keyboardType(.default)
                                
                          
                                
                            }
               
                            
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

                
                
                
                


                .navigationBarTitle(LocalizedStringKey("AddBattery"), displayMode: .inline)
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
                            self.focusField = .batteryCompany
                        case .batteryCompany:
                            self.focusField = nil
                        }
                    }, label:{
                        Text(focusField == .batteryCompany ? "Done" : "Next")
                    })
                           }}}
        
        
       //Cancel
        var leading: some View {

            Button(action : {
                isPresented.toggle()
            }, label: {
                Text(LocalizedStringKey("Cancel"))
                    .accentColor(.red)
            })



        }//VarBody2


    //Done
        var trailing: some View {

            Button(action : {
                vm.uploadBattery {
                }
               isPresented.toggle()
            }, label: {
                Text(LocalizedStringKey("Add"))
                    .accentColor(.red)
             
            })
            .disabled(vm.costString.isEmpty || vm.kmString.isEmpty || vm.batteryComp.isEmpty )


        }//VarBody3
    }//StructView


        
        
        
        
