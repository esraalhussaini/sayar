//
//  MyGarage.swift
//  sayar
//
//  Created by Hadeel Altamimi on 13/06/2022.
//

import SwiftUI


struct MyGarageH: View {
    
//    @State var name: String = ""
    func setupTabBar() {
            let appearance = UINavigationBarAppearance()
            appearance.shadowColor = .gray
            appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
            appearance.backgroundColor = UIColor.white
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        init() {
            setupTabBar()
        }
    
    
    var body: some View {
        
        NavigationView {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            HStack {
//              Text("NJN")
                  
        }//Hstack
//
          
            // .navigationTitle("My Garage")
            // .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {}) { Image(systemName: "plus")
                                .resizable()
                            .foregroundColor(Color("ColorApp")) }
                    }

    ToolbarItem(placement: .navigation) {
        Button(action: {}) { Image(systemName: "chevron.left")
                        .foregroundColor(Color("ColorApp")) }
                    }
        }
                .navigationTitle("My Garage")
                .navigationBarTitleDisplayMode(.inline)
                
            
    }//nav
        
        .background(Color.orange)
        .ignoresSafeArea()
      
        
    }
}

struct MyGarage_Previews: PreviewProvider {
    static var previews: some View {
        MyGarageH()
    }
}
