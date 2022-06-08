//
//  TabView.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//

import SwiftUI

struct TabView: View {
    
    @State var selection = 0

     
         
   
     var body: some View {
       
         NavigationView{
             
             TabView(selection: $selection)
             {
                 HomeCarViewModel()
                     .tabItem {
                       Text("home")
                        Image("Icon")
                             .renderingMode(.template)
                             .resizable()
                             .frame(width: 25, height: 24)
                    
                         
                     }
                     .tag(0)
                   
                 HomeCarViewModel()
                     .tabItem {
                      Text("reports")
                   
                          Image("Icon")
                               .resizable()
                               .frame(width: 25, height: 24)
                         
                               .tint(.green)
                     }
                     .tag(1)
                     
                 
                 
             }
             
             
             
         
             .accentColor(.red)
          
             
             
             
             
             
             
             
         }//nav
    
     
          
    
     
     
     
    }
}




struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
