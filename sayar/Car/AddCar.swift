//
//  AddCar.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import SwiftUI
import UIKit

enum FocusTextCar {
    case Make, Model, Kilometer, ManufactureYear
}
struct AddCar: View {

    @StateObject var addCarViewModel = AddCarViewModel()
    @EnvironmentObject var vImage: ViewModel
    @EnvironmentObject var authvm : AuthViewModel
    @State private var isShowingDialog = false
    @Binding var isPresented: Bool
    @FocusState private var focusField: FocusTextCar?
//    let years = addCarViewModel.generateYearUntilNow()
//    @State private var selectedYear = generateYearUntilNow().last ?? 2022
  
        
        var body: some View {

            NavigationView{
                ZStack{
                    
                    Color.gray.opacity(0.1)
     
                    
                VStack(alignment: .center , spacing: 10){

                    VStack{
                       
                        if let image = addCarViewModel.imageUser {
                    
                                                         Image(uiImage: image)
                                                             .resizable()
                                    
                                                             .frame(height: 140)
                                                      //  .frame(minWidth:50, maxWidth: .infinity)
                                                             .frame(minWidth:50)
                            
                            } else {
                                Image("Cardefault")
               
                                   .resizable()
                           
                                    .frame(width: 180, height: 100)
                            
                            }
                            HStack {
                                Button {
                                
                                    vImage.source = .camera
                                    vImage.showPhotoPicker()
                                } label: {
                                    Text(LocalizedStringKey("Camera"))
                                }
                                Button {
                                  
                                    vImage.source = .library
                                    vImage.showPhotoPicker()
                                } label: {
                                    Text(LocalizedStringKey("Photos"))
                                }
                            }
                       
                    }//vstack image
                    .padding()
                        
                    Form{

                        Section{
                            TextField("Make", text:$addCarViewModel.carMake)
                                .focused($focusField, equals: .Make)
                             
                            TextField(LocalizedStringKey("Model"), text: $addCarViewModel.carModelString)
                                .focused($focusField, equals: .Model)
                            
                            
                        }
                  
                                Section{
//                                    let years = addCarViewModel.generateYearUntilNow()
                  TextField(LocalizedStringKey("ManufactureYear"), text:$addCarViewModel.carManufactureYearString)
                                        .focused($focusField, equals: .ManufactureYear)
                                        .keyboardType(.numberPad)
//                                    Picker("ManufactureYear", selection: $addCarViewModel.carManufactureYearString) {
//                                        ForEach(years, id: \.self) {
//                                            Text("\($0)")
//                                        }
//
//                                }.pickerStyle(.wheel)
                                    TextField(LocalizedStringKey("Km"), text:$addCarViewModel.kmString)
                                        .focused($focusField, equals: .Kilometer)
                                        .keyboardType(.numberPad)
                               
                               
                                    
                                }
    
             
                    }

                        
//     Spacer()
                         //   .padding(.bottom)
                                
                         
                    
                 
                   }//VSTACK
                    VStack{
                        Spacer()
                        nextView()
//                            .background(Color.red)
                            .frame( height: 50 )
                            .background(Color(red: 0.822, green: 0.832, blue: 0.853))
                            .opacity(0.8)
//                            .ignoresSafeArea( .keyboard, edges: .bottom )
                    }

                }//zstack importent

                .sheet(isPresented: $vImage.showPicker, onDismiss: {
                    addCarViewModel.loadImage()
                }, content: {
                    ImagePicker(sourceType: vImage.source == .library ? .photoLibrary : .camera, selectedImage: $addCarViewModel.imageUser)
                    .ignoresSafeArea()
                })
//                .sheet(isPresented: $vImage.showPicker) {
//                    addCarViewModel.loadImage()
//                }{
//                    ImagePicker(sourceType: vImage.source == .library ? .photoLibrary : .camera, selectedImage: $addCarViewModel.imageUser)
//                    .ignoresSafeArea()
//                }

                .navigationBarTitle(LocalizedStringKey("Addcar"), displayMode: .inline)
          .navigationBarItems(leading:leading   ,trailing: trailing)
               
                    
//          .ignoresSafeArea(.all, edges: .bottom)
                    
                    
            }//NavgationView
            .onDisappear(){
//                addCarViewModel.clearState()
            }
        }//varBody1
    @ViewBuilder
        func nextView()-> some View {
            if let focusField = focusField{
                HStack{
                    Spacer()
                    Button(action: {
                        switch focusField {
                        case .Make:
                            self.focusField = .Model
                        case .Model:
                            self.focusField = .ManufactureYear
                        case .ManufactureYear:
                            self.focusField = .Kilometer
                        case .Kilometer:
                            self.focusField = nil
                        }
                    }, label:{
                        Text(focusField == .Kilometer ? "Done" : "Next")
                    })
                    .padding()
                           }}}
        
        var leading: some View {

            Button(action : {
   
                isPresented.toggle()
            }, label: {
                Text(LocalizedStringKey("Cancel"))
                    .accentColor(.red)
            })



        }//VarBody2



        var trailing: some View {

            Button(action : {
         
//            isPresented.toggle()
                addCarViewModel.uploadCar{
                    authvm.fetchCar {
                        
                    }
                }
                isPresented.toggle()

             
               // vm.uploadCar{}
//             showdashboard = true
            }, label: {
                Text(LocalizedStringKey("Add"))
                    .accentColor(.blue)
             
            })

            .disabled(addCarViewModel.carMake.isEmpty || addCarViewModel.carManufactureYearString.isEmpty || addCarViewModel.carModelString.isEmpty )
        }//VarBody3


        
        
        
        
        
        
        
        
        
    }//StructView

   






