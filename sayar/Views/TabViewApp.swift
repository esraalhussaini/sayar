//
//  TabViewApp.swift
//  sayar
//
//  Created by anwar on 10/11/1443 AH.
//

import SwiftUI

struct TabViewApp: View {
    
    
    
    @State var selection = 0
   
   

     var body: some View {
       
         NavigationView{
             
             TabView(selection: $selection) {
            HomeCarViewModel()
                     .tabItem {
                       Text("Car")
                        Image("TabIconCar")
                             .renderingMode(.template)
                             .resizable()
                             .frame(width: 25, height: 24)
                    
                         
                     }
                     .tag(0)
                   
                 ReportsViewModel()
                     .tabItem {
                      Text("Reports")
                     
                          Image("Pie")
                             .renderingMode(.template)
                                .resizable()
                               .frame(width: 25, height: 24)
                            
                     }
                     .tag(1)
                 
                 
                 
                 
                 AccountViewModel()
                     .tabItem {
                      Text("Account")
                   
                          Image("TabIconAccount")
                             .renderingMode(.template)
                               .resizable()
                               .frame(width: 25, height: 24)
                         
                              
                     }
                     .tag(2)
                     
                 
                 
             }
             
             
             
             .accentColor(Color("ColorApp"))
            // .accentColor(.red)
          
             
             
             
             
             
             
             
         }//nav
    
     
          
    
     
     
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    }
}

struct TabViewApp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}



