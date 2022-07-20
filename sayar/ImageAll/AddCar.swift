//
//  AddCar.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import SwiftUI
import UIKit

//enum ActiveSheet: Identifiable {
//    case first, second
//
//    var id: Int {
//        hashValue
//    }
//}
//
//
//@Published var makeString : String = ""
//     @Published var modelString : String = ""
//
//  @Published  var carManufactureYearIntString : Int = 0
//  @Published var carKmString : Int = 0
//  @Published var  carImageUrlString : String = ""
//

struct AddCar: View {
//image
 

//    @StateObject var viewModelVar = addCarViewModel()
    
  //for image
    //For image picker
  
    @EnvironmentObject var vImage: ViewModel
    
    @EnvironmentObject var authvm : AuthViewModel
  // @State private var showSheet = false
      // @State private var activeSheet: ActiveSheet? = .first
    
    //button Delete
        @State private var isShowingDialog = false
    @StateObject var vm = addCarViewModel()
//    @Binding var showdashboard : Bool
        
   // @State private var showSheet = false
    
@Binding var isPresented: Bool
  
        @Binding var Make: String
        @Binding var Model: String
        
        @Binding var kmCar: String
        //Km Double or int?
@Binding var carManufactureYear : String
        
        var body: some View {

            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
                 
                
//                        Image("DefualtCar")
//                //button
//                        Text("Add Photo")
//
                  
                    
                    
                    
                VStack(alignment: .center , spacing: 10){
               
                    

                        //image
                      //  Color.gray.opacity(0.1)
                    VStack{
                       
                            if let image = vImage.image {
                    
                                ZoomableScrollView {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                   
                                }
                            } else {
                               // Image("DefualtCar")
                            Image(systemName: "photo.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0.6)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding(.horizontal)
                            }
                            HStack {
                                Button {
                                
                                    vImage.source = .camera
                                    vImage.showPhotoPicker()
                                } label: {
                                    Text("Camera")
                                }
                                Button {
                                  
                                    vImage.source = .library
                                    vImage.showPhotoPicker()
                                } label: {
                                    Text("Photos")
                                }
                            }
                            Spacer()
                    }//vstack image
             
                        
                    Form{
                        
                     
                  
                   // VStack(alignment: .leading) {
                    
                        Section{
                            TextField("Make", text:$vm.carMake)
                             
                            TextField("Model", text: $vm.carModelString )
                            
                            
                        }
                  
                                Section{
                                    
                                    TextField("Manufacture Year", text:$vm.carManufactureYearString)
                                        .keyboardType(.numberPad)
                                    TextField("Km", text:$vm.kmString)
                                        .keyboardType(.numberPad)
                               
                               
                                    
                                }
    
             
                    }
                    //form
                        
//                        //-------delet
//                        Button("Delete", role: .destructive) {
//                                  isShowingDialog = true
//                              }
//                      //  .font(.headline)
//                 //   .frame(width: 280, height: 50)
//                        //    .background(.white)
//
//                              //  .cornerRadius(6)
//                      //  .buttonStyle(.bordered)
//                              .controlSize(.large)
//                              .confirmationDialog("Are you sure to delete the data?", isPresented: $isShowingDialog, titleVisibility: .visible) {
//
//                                  Button("Confirm", role: .destructive) {
//                                      // Handle the delete action.
//
//                                      viewModelVar.uploadCar {
//                                          print("Successfully uploaded")
//                                      }
//                                  }
//                                  Button("Cancel", role: .cancel) {
//
//                                  }
//                              }
//
//                        //-------delete
//
                        
     Spacer()
                         //   .padding(.bottom)
                                
                         
                    
                 
                   }//VSTACK
                 

                }//zstack importent

                
                
                
                
    
            
            
            
            
            
            

   
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
         
//            isPresented.toggle()
                vm.uploadCar{}
           
               isPresented.toggle()
               // vm.uploadCar{}
//             showdashboard = true
            }, label: {
                Text("Done")
                    .accentColor(.red)
             
            })



        }//VarBody3


        
        
        
        
        
        
        
        
        
    }//StructView

   






