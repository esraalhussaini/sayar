//
//  AddFuel View.swift
//  sayar
//
//  Created by Razan Altamimi on 08/11/1443 AH.
//

import SwiftUI

enum FocusText {
    case cost, Kilometer, oilcompany
}
struct AddOilView: View {
    
    @FocusState private var focusField: FocusText?

    @State private var isShowingDialog = false
    @State private var selected = 0
    @EnvironmentObject  var vm : OilViewModel
    var oilType = ["3","5", "8", "10", "15",]
//       @State private var selectedKiloMeters = "5 KiloMeters"
//    @FocusState private var focusConfirm: Bool
        
    //Pluse button

        
        
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
                                    TextField("SAR", text:$vm.costString)
                                        .focused($focusField, equals: .cost)
                                                            .submitLabel(.next)
                                                            .onSubmit {
                                                                focusField = .Kilometer
                                                            }
                                        .keyboardType(.numberPad)
                                        
                                    
                                }
                            
                            
                            Section{
                                TextField(LocalizedStringKey("km"), text:$vm.kmString)
                                    .focused($focusField, equals: .Kilometer)
                                                        .submitLabel(.next)
                                                        .onSubmit {
                                                            focusField = .oilcompany
                                                        }
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
                                                            .submitLabel(.done)

                                    .keyboardType(.twitter)
                                    

                              
                                        
                                
                            }
                            
                            
                        }
                            
//                            Section{
//                                TextField("ExpectedTime", text:$ExpectedTime)
//                                    .keyboardType(.numberPad)
//
//
//
//                            }
                            
                          
                            
              }//form
                        
 
                         
                    
                 
                    }//VSTACK IMAGE
                 

                }//zstack importent

                
                
                
                
   

                .navigationBarTitle("Add Oil", displayMode: .inline)
          .navigationBarItems(leading:leading   ,trailing: trailing)
               
                    
          .ignoresSafeArea(.all, edges: .bottom)
          .alert(item: $vm.appError) { alert in
              Alert(title: Text(""), message: Text("\(alert.localizedDescription)"))
          }
                    
            }//NavgationView
        }//varBody1

        
        
        
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
            }, label: {
                Text("Done")
                    .accentColor(.red)
             
            })



        }//VarBody3
}//StructView

 
