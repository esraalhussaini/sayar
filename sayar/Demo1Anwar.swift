//
//  Demo1Anwar.swift
//  sayar
//
//  Created by anwar on 22/11/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseCore

struct Demo1Anwar: View {
    private var addButton : some View {
        Button(action: {}) {
          Image(systemName: "plus")
            
        }//button
        
    }//pravite Button body 2
    
    var body: some View {
        
        NavigationView {
            List {
                Text("Hello ")
                
            }//list1
            .navigationBarTitle("Books")
            .navigationBarItems(trailing:  addButton)
            
            
        }//nav
        
        
    }//body 1
}//strct

















struct Demo1Anwar_Previews: PreviewProvider {
    static var previews: some View {
        Demo1Anwar()
    }
}
