//
//  AccountViewModel.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//

import SwiftUI

struct AccountViewModel: View {
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
                       NavigationLink(destination: ResultView()) {
                           
                           Text("Choose Heads")
                       }
                       .navigationBarTitle("", displayMode: .inline)
               }//nav
    }
}


struct ResultView: View {
   // var choice: String

    var body: some View {
        Text("HGHGHG")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                Button(action: {}) {
                Image(systemName: "plus")
                .resizable()
                .foregroundColor(Color("ColorApp")) }
                }
    }
            .navigationTitle("My Garage")
            .navigationBarTitleDisplayMode(.inline)
      //  Text("You chose \(choice)")
            /// make it horizontally adjacent
    }
}


struct AccountViewModel_Previews: PreviewProvider {
    static var previews: some View {
        AccountViewModel()
    }
}
