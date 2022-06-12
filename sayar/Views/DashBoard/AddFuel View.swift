//
//  AddFuel View.swift
//  sayar
//
//  Created by Razan Altamimi on 08/11/1443 AH.
//

import SwiftUI

struct AddFuel_View: View {
    
    @State private var SAR = ""
    @State private var KM = ""
    @State private var DATE = ""
    
    var body: some View {
        
        NavigationView{
        Form
        {
            
            Section{
                
                TextField("13/4/2022",text: $DATE)
                  
                
               
                
                
            }
            Section{
                TextField("SAR",text: $SAR)
                TextField("KM",text: $KM)
                
            }
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                
                
                Button("Cancel"){
                    
                    print("Cancelled")
                    
                }
                Button("Done"){
                    
                    print("Has been saved")
                }
               
                
            }
           
           
            
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
        .background(Color("Grey"))
    }
}

struct AddFuel_View_Previews: PreviewProvider {
    static var previews: some View {
        AddFuel_View()
            .preferredColorScheme(.light)
    }
}
