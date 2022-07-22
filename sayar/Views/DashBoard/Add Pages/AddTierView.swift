//
//  AddTierView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct AddTierView: View {
 
    @State private var isShowingDialog = false
    @EnvironmentObject  var vm : TiresViewModel
    
//    var years = Date().generateYearUntilNow()
//    @State private var selectedYear = Date().generateYearUntilNow().last ?? 2022

    @Binding var isPresented: Bool
    var body: some View {
        
        
        NavigationView{
            ZStack{
                
                Color.gray.opacity(0.1)
             
                VStack(alignment: .center , spacing: 10){
                    Form{
             
                
                    Section{
                        
                        DatePicker("Pick a date", selection: $vm.date, displayedComponents: .date)
                       
                        
                    }
                        
                            Section{
                                TextField("SAR", text:$vm.costString)
                                    .keyboardType(.numberPad)
                           
                                TextField("Km", text:$vm.kmString)
                                    .keyboardType(.numberPad)
                            }
                        Section{
                       //  VStack {
//    Picker("Please choose a Manufacture Year", selection: $vm.manufactureYEAR) {
//                                ForEach(years, id: \.self) {
//                                    Text("\($0)")
//                                }
//    }.pickerStyle(.wheel)
//                            Text("You selected: \(selectedYear)")
                     //   }
                           DatePicker("Manufacturing year", selection:$vm.manufactureYEAR, displayedComponents: .date)
                       
                            
                            TextField(" Tire Comapany", text:$vm.tireComp)
                                .keyboardType(.default)
                            
                       
                            
                        }
                        
          }//form


             
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

extension Date {
func generateYearUntilNow ()->[Int]{
         var formattedDate: String? = ""

         let format = DateFormatter()
         format.dateFormat = "yyyy"
         formattedDate = format.string(from: self)

 //        var yearsTillNow: [String] {
             var years = [Int]()
             for i in (Int(formattedDate!)!-70..<Int(formattedDate!)!+1).reversed() {
                 years.append(i)
             }
             return years
 //        }
     }
}


    
    
    
    
