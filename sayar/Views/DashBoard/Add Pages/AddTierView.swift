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
    @State private var DATE = Date()

    var body: some View {
        
        
        NavigationView{
        Form
        {
            
            Section(header: Text("date")){
                HStack(alignment: .center){
                    Image("Calender-1")
                    DatePicker("Pick a date", selection: $DATE, displayedComponents: .date)
                        . datePickerStyle(CompactDatePickerStyle())
                        .accentColor(.red)
                         }
                    .font(Font.system(size: 17, design: .default))
                     .padding(5)
                     .font(Font.system(size: 15, weight: .medium, design: .serif))
            
                
            }.listRowBackground(Color(red: 0.976, green: 0.976, blue: 0.976))
            
            
            Section(header: Text("Cost")){
                HStack{
                TextField("amount",text: $SAR)
                    Text("SR")
                }
                
            }.listRowBackground(Color("Grey"))
            
            Section(header: Text("odemeter")){
                HStack{
                
                TextField("Kilometers",text: $KM)
                    Text("KM")
                }
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
//            Section(header: Text("Reminder")){
//
//
//                Toggle(isOn: .constant(true), label:{Image("Calender-1");Text("Date")} ).listRowBackground(Color("Grey"))
//
//            }
        
            
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
