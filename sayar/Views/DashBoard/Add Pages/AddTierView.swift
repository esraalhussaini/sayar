//
//  AddTierView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct AddTierView: View {
 
    @State private var isShowingDialog = false
//    @StateObject var vm = TiresViewModel()
    @EnvironmentObject  var vm : TiresViewModel
//Pluse button

    
    
    @Binding var isPresented: Bool

//@Binding var  DATE: Date
 // @Binding var  DATE = Date()
//@Binding var cost : String
//@Binding var TiersYearRelease  : String
//@Binding var ExpectedTime : String

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
                                TextField("SAR", text:$vm.costString)
                                    .keyboardType(.numberPad)
                           
                                TextField("Km", text:$vm.kmString)
                                    .keyboardType(.numberPad)
                            }
                        Section{
//                            struct ContentView: View {
//                                @State var selection = Date()
//                                var body: some View {
//                                    Picker("", selection: $selection) {
//                                        ForEach(2000...2020, id: \.self) {
//                                            Text(String($0))
//                                        }
//                                    }
//                                    .pickerStyle(InlinePickerStyle())
//                                }
//                            }
                            DatePicker("Manufacturing year", selection:$vm.manufactureYEAR, displayedComponents: .date)
                            
                            
                            TextField(" Tire Comapany", text:$vm.tireComp)
                                .keyboardType(.default)
                            
                       
                            
                        }
                
//                        Section{
//                            TextField("TiersYearRelease", text:$TiersYearRelease)
//                                .keyboardType(.numberPad)
//
//
//                        }
                        
                        
//                        Section{
//                            TextField("ExpectedTime", text:$ExpectedTime)
//                                .keyboardType(.numberPad)
//
//
//                        }
                        
                        
          }//form
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  
                    
 Spacer()
                        .padding(.bottom)
                            
                     
                
             
                }//VSTACK IMAGE
             

            }//zstack importent

            
            
            
            


            .navigationBarTitle("Add Tiers", displayMode: .inline)
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
            vm.uploadTires {
            }
            
           isPresented.toggle()
        }, label: {
            Text("Done")
                .accentColor(.red)
         
        })



    }//VarBody3
}//StructView


    
    
    
    
