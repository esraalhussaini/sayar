//
//  AddOilView.swift
//  sayar
//
//  Created by Razan Altamimi on 13/11/1443 AH.
//

import SwiftUI
enum FocusTextFuel {
    case cost, Kilometer
}
struct AddFuelView: View {
    //Notification
    @StateObject private var notificationManager = NotificationManager()
    //--------
    @State private var isShowingDialog = false
//   @StateObject var vm = FuelViewModel()
    @EnvironmentObject  var vm : FuelViewModel
    @FocusState private var focusField: FocusTextFuel?
//Pluse button

    
    
    @Binding var isPresented: Bool

//@State  var  date  = Date()
 // @Binding var  DATE = Date()
//@Binding var cost : String
//@Binding var km  : String


    
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
                                
                                TextField(LocalizedStringKey("km"), text:$vm.kmString)
                                    .focused($focusField, equals: .Kilometer)
                                        .keyboardType(.numberPad)
                                
                                
                          
                   }//section
                        
                     
                   
                        
                      
                        
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

            
            
            
            


            .navigationBarTitle(LocalizedStringKey("AddFuel"), displayMode: .inline)
      .navigationBarItems(leading:leading   ,trailing: trailing)
           
                
//      .ignoresSafeArea(.all, edges: .bottom)
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
                            self.focusField = nil
                        }
                    }, label:{
                        Text(focusField == .Kilometer ? "Done" : "Next")
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
            vm.uploadFuel {
                print("SAVED !!!!!!!!!!!!!!!! ")
                isPresented.toggle()
            }
        
        }, label: {
            Text(LocalizedStringKey("Add"))
                .accentColor(.red)
         
        })

        .disabled(vm.costString.isEmpty )

    }//VarBody3
}//StructView


    
