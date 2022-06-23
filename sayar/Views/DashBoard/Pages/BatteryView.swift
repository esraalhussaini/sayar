//
//  BatteryView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct BatteryView: View {
    @StateObject var vm = BatteryViewModel()
 
   // @State private var searchText = ""

    var body: some View {
        
        
        List(vm.battery){f in
          
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text("\(f.cost)").fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("\(f.km)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer(minLength: 5)
                    Text("\(f.date)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    
                    
                    
                    
                }.padding().background(Color("Grey"))
                .cornerRadius(10)
                
                
          
         
                
                
                
                
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
        
        
        
        
  //Code RazN
//
////
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
//                .navigationTitle("Battery")
//                .navigationBarTitleDisplayMode(.inline)
//                .searchable(text: $searchText)
//
//
//
//
//        .background(Color.orange)
//        .ignoresSafeArea()
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView()
    }
}
