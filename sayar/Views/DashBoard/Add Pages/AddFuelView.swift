//
//  AddOilView.swift
//  sayar
//
//  Created by Razan Altamimi on 13/11/1443 AH.
//

import SwiftUI

struct AddFuelView: View {
    @State private var isShowingDialog = false
    
    
//Pluse button

    
    
    @Binding var isPresented: Bool

@Binding var  DATE: Date
 // @Binding var  DATE = Date()
@Binding var cost : String
@Binding var km  : String


    
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
                        
                        DatePicker("Pick a date", selection: $DATE, displayedComponents: .date)
                       // TextField("Make", text:$titel)
                       // TextField("Model", text: $post )
                        
                    }
                        
                            Section{
                                TextField("SAR", text:$cost)
                                    .keyboardType(.numberPad)
                                
                                    TextField("km ", text:$km)
                                        .keyboardType(.numberPad)
                          
                   }//section
                        
                     
                   
                        
                      
                        
          }//form
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                 
                
                    
 Spacer()
                        .padding(.bottom)
                            
                     
                
             
                }//VSTACK IMAGE
             

            }//zstack importent

            
            
            
            


            .navigationBarTitle("Add Fuel", displayMode: .inline)
      .navigationBarItems(leading:leading   ,trailing: trailing)
           
                
      .ignoresSafeArea(.all, edges: .bottom)
                
                
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
           isPresented.toggle()
        }, label: {
            Text("Done")
                .accentColor(.red)
         
        })



    }//VarBody3
}//StructView


    
    
    
    
    
    
    
    
    
    
    
    

