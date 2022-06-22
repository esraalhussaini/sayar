//
//  FuelView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct FuelView: View {
   @StateObject var vm = FuelViewModel()
   // @State private var searchText = ""

    var body: some View {
        
        
        
        List(vm.fuel){f in
            VStack{
                Text("\(f.cost)")
                Text("\(f.km)")
                Text("\(f.date)")
            }
          
            
        }
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
        
        
        
        
      //CODE Razan
//        NavigationView {
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
//                .navigationTitle("Fuel")
//                .navigationBarTitleDisplayMode(.inline)
//                .searchable(text: $searchText)
//
//
//    }//nav
//
//        .background(Color.orange)
//        .ignoresSafeArea()
    }
}

struct FuelView_Previews: PreviewProvider {
    static var previews: some View {
        FuelView()
        
        
    }
}
