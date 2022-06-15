//
//  OilView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct OilView: View {
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
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            //            Text("Hello, World!")
            HStack {
                //              Text("NJN")
                
            }//Hstack
            //
            
            // .navigationTitle("My Garage")
            // .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: AddOilView()) {
                        Button(action: {}) { Image(systemName: "plus")
                                .resizable()
                            .foregroundColor(Color("ColorApp")) }
                    }
                    
                    
                    
                    
                }
                
                ToolbarItem(placement: .navigation) {
                    Button(action: {}) { Image(systemName: "chevron.left")
                        .foregroundColor(Color("ColorApp")) }
                }
            }
            .navigationTitle("Oil")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            
        }//nav
        
        .background(Color.orange)
        .ignoresSafeArea()
    }
}

struct OilView_Previews: PreviewProvider {
    static var previews: some View {
        OilView()
    }
}
