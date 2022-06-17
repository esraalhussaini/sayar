//
//  AddFuel View.swift
//  sayar
//
//  Created by Razan Altamimi on 08/11/1443 AH.
//

import SwiftUI

struct AddOilView: View {

        @State private var isShowingDialog = false
        
        
        
        
        
        @Binding var isPresented: Bool
        @Binding var titel: String
        @Binding var post: String
        
        @Binding var kmCar: String
        //Km Double or int?
        
        
        var body: some View {

            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
                 
                    VStack(alignment: .center , spacing: 10){
                       Spacer()
                        Image("DefualtCar")
                //button
                        Text("Add Photo")
                
                        
                        
                        Form{
                 
                    
                        Section{
                            TextField("Make", text:$titel)
                            TextField("Model", text: $post )
                            
                        }
                            
                                Section{
                                    TextField("Km", text:$kmCar)
                                        .keyboardType(.numberPad)
                               
                                    
                                }
              }//form
                        
                        //-------delete
                        Button("Delete", role: .destructive) {
                                  isShowingDialog = true
                              }
         
                              .controlSize(.large)
                              .confirmationDialog("Are you sure to delete the data?", isPresented: $isShowingDialog, titleVisibility: .visible) {
                       
                                  Button("Confirm", role: .destructive) {
                                      // Handle the delete action.
                                  }
                                  Button("Cancel", role: .cancel) {
                       
                                  }
                              }
                        
                        //-------delete
                    
                        
     Spacer()
                            .padding(.bottom)
                                
                         
                    
                 
                    }//VSTACK IMAGE
                 

                }//zstack importent

                
                
                
                
   

                .navigationBarTitle("Add car", displayMode: .inline)
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

 
        
        
        
        
        
        
        
        
        
        
        
        
