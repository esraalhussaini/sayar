//
//  AddTierView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct AddTierView: View {
    func setupTabBar() {
            let appearance = UINavigationBarAppearance()
          
            appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
            appearance.backgroundColor = UIColor.white
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        init() {
            UITableView.appearance().backgroundColor = .clear
            setupTabBar()
        }
    
    @State private var SAR = ""
    @State private var KM = ""
    @State private var DATE = ""
    
    var body: some View {
        
        
        NavigationView{
        Form
        {
            
            Section(header: Text("date")){
                
                TextField("13/4/2022",text: $DATE)
                  
                
               
                
                
            }.listRowBackground(Color("Grey"))
            
            
            Section(header: Text("Cost")){
                TextField("SAR",text: $SAR)
           
                
            }.listRowBackground(Color("Grey"))
            
            Section(header: Text("odemeter")){
                
                
                TextField("KM",text: $KM)
                 
            }.listRowBackground(Color("Grey"))
//            HStack{
//
//                Section(header: Text("5 KM")){
//
//
//                    TextField("Oil Type",text: $KM)
//
//                }
//
//                VStack{
//                Section(header: Text("Expected Time")){
//                    Spacer()
//
//                    TextField("5 Months",text: $KM)
//                }
//                }
                
            //}
            Section(header: Text("Reminder")){
                
               
                Toggle(isOn: .constant(true), label:{Image("Calender-1");Text("Date")} ).listRowBackground(Color("Grey"))
                
            }
        
            
        }
        .toolbar{
            
            
            
            
            ToolbarItem(placement: .primaryAction) {
                            Button("Done") {}
                        }
            ToolbarItem(placement: .principal) { // <3>
                           VStack {
                               Text("Add Tiers").font(.headline)
                              
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

struct AddTierView_Previews: PreviewProvider {
    static var previews: some View {
        AddTierView()
    }
}
