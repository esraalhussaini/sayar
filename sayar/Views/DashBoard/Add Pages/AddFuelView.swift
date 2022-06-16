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
    @State private var DATE = ""
    
    var body: some View {
   
        
        NavigationView{
        Form
        {
         
           

            
            Section{
                
                TextField("13/4/2022",text: $DATE)
                  
                
               
                
                
            }.listRowBackground(Color("Grey"))
            
            
            Section{
                TextField("SAR",text: $SAR)
                TextField("KM",text: $PickKM)
                
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
