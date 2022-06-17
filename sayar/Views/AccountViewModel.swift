//
//  AccountViewModel.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//

import SwiftUI

struct AccountViewModel: View {
  
    var body: some View {
        NavigationView {
                       NavigationLink(destination: MyGarageH()) {
                           
                           Text("Choose Heads")
                       }
                       .navigationBarTitle("")
               }//nav
    }
}


//struct ResultView: View {
//   // var choice: String
//
//    var body: some View {
//        Text("HGHGHG")
//
//
//    }
//}
//

struct AccountViewModel_Previews: PreviewProvider {
    static var previews: some View {
        AccountViewModel()
    }
}
