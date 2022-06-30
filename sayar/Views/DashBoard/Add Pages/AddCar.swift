//
//  AddCar.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import SwiftUI

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


    @StateObject var viewModelVar = addCarViewModel()
    
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
  
        @Binding var titel: String
        @Binding var post: String
        
        @Binding var kmCar: String
        //Km Double or int?
        
        
        var body: some View {

            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
                 
                
//                        Image("DefualtCar")
//                //button
//                        Text("Add Photo")
//
                        
                    VStack(alignment: .center , spacing: 10){

                        VStack{
                            if let image = vImage.image {
                    
                                ZoomableScrollView {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                   
                                }
                            } else {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0.6)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding(.horizontal)
                            }
                            HStack {
                                Button {
                                
//                                                        self.isPresented.toggle()
//                                    self.activeSheet = .first
                                           
                                    vImage.source = .camera
                                    vImage.showPhotoPicker()
                                } label: {
                                    Text("Camera")
                                }
                                Button {
                                    
//                                    self.isPresented.toggle()
//                self.activeSheet = .first
                               
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
                         //   TextField("Make", text:$viewModelVar.makeString)
                             
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
                                      
                                      viewModelVar.uploadCar {
                                          print("Successfully uploaded")
                                      }
                                  }
                                  Button("Cancel", role: .cancel) {
                       
                                  }
                              }
                        
                        //-------delete
                    
                        
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
            
            
            
            
            
            

//            .sheet(isPresented: vImage.showPicker) {
//                ImagePicker(sourceType: vImage.source == .library ? .photoLibrary : .camera, selectedImage: $vImage.image)
//                    .ignoresSafeArea()
//            }
//            .sheet(isPresented: $showSheet) {
//                            if self.activeSheet == .first {
//                                ImagePicker(sourceType: vImage.source == .library ? .photoLibrary : .camera, selectedImage: $vImage.image
//
//                                Text("First modal view")
//                            }
//                            else {
//                                Text("Only the second modal view works!")
//                            }
//                        }
            
            
            
            
            
//            .sheet(isPresented: self.$showOne) {
//                                    OneView().environment(\.managedObjectContext, self.managedObjectContext)
//                                }
////
          
            
            
            
            
            
       
    
            
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
                
                
                viewModelVar.uploadCar{}
               isPresented.toggle()
               // vm.uploadCar{}
//             showdashboard = true
            }, label: {
                Text("Done")
                    .accentColor(.red)
             
            })



        }//VarBody3


        
        
        
        
        
        
        
        
        
    }//StructView

   






