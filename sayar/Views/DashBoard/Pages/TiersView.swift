//
//  TiersView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct TiersView: View {

    
   // @State private var searchText = ""
    
    var body: some View {
      
            
            
            Text("NKKK")
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                Button(action: {}) {
                Image(systemName: "plus")
                .resizable()
                .foregroundColor(Color("ColorApp")) }
                }
    }
            .navigationTitle("Oil")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            
  //Code Razan
//
//            HStack {
////              Text("NJN")
//
//        }//Hstack
////
//
//            // .navigationTitle("My Garage")
//            // .navigationBarTitleDisplayMode(.large)
//                .toolbar {
//                    ToolbarItem(placement: .primaryAction) {
//                        Button(action: {}) { Image(systemName: "plus")
//                                .resizable()
//                            .foregroundColor(Color("ColorApp")) }
//                    }
//
//    ToolbarItem(placement: .navigation) {
//        Button(action: {}) { Image(systemName: "chevron.left")
//                        .foregroundColor(Color("ColorApp")) }
//                    }
//        }
//                .navigationTitle("Tiers")
//                .navigationBarTitleDisplayMode(.inline)
//
//
//
//                .searchable(text: $searchText)
//
//    }//nav
//
//        .background(Color.orange)
//        .ignoresSafeArea()
    }
}

struct TiersView_Previews: PreviewProvider {
    static var previews: some View {
        TiersView()
    }
}
