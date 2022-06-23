//
//  AddOilView.swift
//  sayar
//
//  Created by Razan Altamimi on 13/11/1443 AH.
//

import SwiftUI

struct AddFuelView: View {
    func setupTabBar() {
    let appearance = UINavigationBarAppearance()
    appearance.shadowColor = .gray
    appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
    appearance.backgroundColor = UIColor.white
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}
init() {
    UITableView.appearance().backgroundColor = .clear
    setupTabBar()
}
    
   
      
    
    @State private var SAR = ""
    @State private var PickKM = ""
    @State private var DATE = Date()

    var body: some View {
   
        
        NavigationView{
        Form
        {
         
           

            
            Section{
                
                HStack(alignment: .center){
                    Image("Calender-1")
                    DatePicker("Pick a date", selection: $DATE, displayedComponents: .date)
                        . datePickerStyle(CompactDatePickerStyle())
                        .accentColor(.red)
                         }
                    .font(Font.system(size: 17, design: .default))
                     .padding(5)
                     .font(Font.system(size: 15, weight: .medium, design: .serif))
                
               
                
                
            }.listRowBackground(Color("Grey"))
            
            
            Section{
                HStack{
                TextField("amount",text: $SAR)
                Text("SR")
                }
                HStack{
                TextField("Kilometers",text: $PickKM)
                Text("KM")

                }
            }.listRowBackground(Color("Grey"))
            
        }
            
        .toolbar{
            
            
            ToolbarItem(placement: .primaryAction) {
                            Button("Done") {}
                        }
            ToolbarItem(placement: .principal) { // <3>
                           VStack {
                               Text("Add Fuel").font(.headline)
                              
                           }
                       }

            ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {}
                        }
//
            
           
           
            
        }
            
        }.accentColor(.red)
       
      
//
//        VStack{
//
//            Text("لازم نص لان طالع ايرور مافيه كود حطيته بشكل مؤقت")
//
//
//
//        }
            .background(Color.white)
    }
        
    }


struct AddFuelView_Previews: PreviewProvider {
    static var previews: some View {
        AddFuelView()
    }
}
