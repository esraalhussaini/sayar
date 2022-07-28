//
//  AddTierView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI
enum FocusTextTires {
    case cost, Kilometer, tireCompany
}
struct AddTierView: View {
    @FocusState private var focusField: FocusTextTires?
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
                                TextField(LocalizedStringKey("SAR"), text:$vm.costString)
                                    .focused($focusField, equals: .cost)
                                    .keyboardType(.numberPad)
                           
                                TextField(LocalizedStringKey("Km"), text:$vm.kmString)
                                    .keyboardType(.numberPad)
                                    .focused($focusField, equals: .Kilometer)
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
                       
                            
                            TextField(LocalizedStringKey("TireComapany"), text:$vm.tireComp)
                                .focused($focusField, equals: .tireCompany)
                                .keyboardType(.default)
                            
                       
                            
                        }
                        
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

            .navigationBarTitle(LocalizedStringKey("AddTires"), displayMode: .inline)
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
                            self.focusField = .tireCompany
                        case .tireCompany:
                            self.focusField = nil
                        }
                    }, label:{
                        Text(focusField == .tireCompany ? "Done" : "Next")
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
            vm.uploadTires {
            }
            
           isPresented.toggle()
        }, label: {
            Text(LocalizedStringKey("Add"))
                .accentColor(.blue)
         
        })
        .disabled(vm.costString.isEmpty || vm.kmString.isEmpty || vm.tireComp.isEmpty )


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


    
    
    
    
