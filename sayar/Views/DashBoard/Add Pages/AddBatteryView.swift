//
//  AddBatteryView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct AddBatteryView: View {
    
    @State private var isShowingDialog = false
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
                                        .keyboardType(.numberPad)
                                    
                                    TextField(LocalizedStringKey("Km"), text:$vm.kmString)
                                        .keyboardType(.numberPad)
                                    
                                }
                            Section{
                                TextField(LocalizedStringKey("BatteryComapany"), text:$vm.batteryComp)
                                    .keyboardType(.default)
                                
                          
                                
                            }
                
                    
                            
//                                    Section{
//                                        TextField("BatteryYearRelease", text:$BatteryYearRelease )
//                                            .keyboardType(.numberPad)
//
//
//                                    }
                                    
                                    
//                                    Section{
//                                        TextField("ExpectedTime", text:$ExpectedTime)
//                                            .keyboardType(.numberPad)
//
//
//                                    }
                            
                           
                            
                            
              }//form
    
                         
                    
                 
                    }//VSTACK IMAGE
                 

                }//zstack importent

                
                
                
                


                .navigationBarTitle(LocalizedStringKey("AddBattery"), displayMode: .inline)
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
                Text(LocalizedStringKey("Done"))
                    .accentColor(.red)
             
            })



        }//VarBody3
    }//StructView


        
        
        
        
