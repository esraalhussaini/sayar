//
//  AddOilView.swift
//  sayar
//
//  Created by Razan Altamimi on 13/11/1443 AH.
//

import SwiftUI

struct AddOilView: View {
    
    @State private var SAR = ""
    @State private var PickKM = ""
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
                TextField("KM",text: $PickKM)
                
            }
            
        }
            
        .toolbar{
            
            
            ToolbarItem(placement: .primaryAction) {
                            Button("Done") {}
                        }
            ToolbarItem(placement: .principal) { // <3>
                           VStack {
                               Text("Oil").font(.headline)
                              
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
        .background(Color("Grey"))
    }
        
    }


struct AddOilView_Previews: PreviewProvider {
    static var previews: some View {
        AddOilView()
    }
}
