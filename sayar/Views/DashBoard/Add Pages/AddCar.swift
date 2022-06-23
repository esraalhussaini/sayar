//
//  AddCar.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import SwiftUI

struct AddCar: View {
  
    
    
    //button Delete
        @State private var isShowingDialog = false
    @StateObject var vm = addCarViewModel()
//    @Binding var showdashboard : Bool
        
        
        
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
                   // VStack(alignment: .leading) {
                    
                        Section{
                            TextField("Make", text:$titel)
                            TextField("Model", text: $post )
                            
                        }
                            
                                Section{
                                    TextField("Km", text:$kmCar)
                                        .keyboardType(.numberPad)
                               
                                    
                                }
                            
                      
                     
                                                //.padding()
                                      
                                               // .cornerRadius(6)
                                             //.padding(.bottom)
                                      
                   
                        
                        
                                           // TextField("Model", text: $post )
                                               //.padding()
                                           // .background(Color.red)
                                               // .cornerRadius(6)
                                             //   .padding(.bottom)
    //                        .background(Color.white)
    //
                        //Spacer()
                    
                  //  }//VstackText
                            
                            
                          
                               
                                    
                            
                            
                           
                                    
                           
             
                    }//form
                        
                        //-------delet
                        Button("Delete", role: .destructive) {
                                  isShowingDialog = true
                              }
                      //  .font(.headline)
                 //   .frame(width: 280, height: 50)
                        //    .background(.white)
                        
                              //  .cornerRadius(6)
                      //  .buttonStyle(.bordered)
                              .controlSize(.large)
                              .confirmationDialog("Are you sure to delete the data?", isPresented: $isShowingDialog, titleVisibility: .visible) {
                       
                                  Button("Confirm", role: .destructive) {
                                      // Handle the delete action.
                                  }
                                  Button("Cancel", role: .cancel) {
                       
                                  }
                              }
                        
                        //-------delet
                    
                        
     Spacer()
                            .padding(.bottom)
                                
                         
                    
                 
                    }//VSTACK IMAGE
                 

                }//zstack importent

                
                
                
                
    //            ZStack {
    //                Color.gray.opacity(0.1)
    //                VStack(alignment: .leading) {
    //
    //     Text("Create New Post")
    //                        .font(Font.system(size: 16, weight: .bold))
    //                    TextField("titel", text:$titel )
    //                        .padding()
    //                        .background(Color.white)
    //                        .cornerRadius(6)
    //                        .padding(.bottom)
    //
    //                    TextField("write something..", text: $post )
    //                        .padding()
    //                        .background(Color.white)
    //                        .cornerRadius(6)
    //                        .padding(.bottom)
    //
    //                Spacer()
    //                }//Vstack .
    //                .padding()
    //
    //            }//Zstack

                .navigationBarTitle("Add car", displayMode: .inline)
          .navigationBarItems(leading:leading   ,trailing: trailing)
               
                    
          .ignoresSafeArea(.all, edges: .bottom)
                    
                    
            }//NavgationView
        }//varBody1

        
        
        
        
        var leading: some View {

            Button(action : {
                isPresented.toggle()
            }, label: {
                Text("Cancel")
                    .accentColor(.red)
            })



        }//VarBody2



        var trailing: some View {

            Button(action : {
               isPresented.toggle()
                vm.uploadCar{}
//             showdashboard = true
            }, label: {
                Text("Done")
                    .accentColor(.red)
             
            })



        }//VarBody3


        
        
        
        
        
        
        
        
        
    }//StructView

    //struct Page_Add_Car_Previews: PreviewProvider {
    //    static var previews: some View {
    //        Page_Add_Car()
    //    }
    //}

