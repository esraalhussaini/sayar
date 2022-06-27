//
//  VehicleView.swift
//  sayar
//
//  Created by anwar on 28/11/1443 AH.
//

import SwiftUI
//import SDWebImageSwiftUI
import Firebase
import FirebaseCore

struct VehicleView: View {
    @StateObject var viewModel = VehiclesViewModel()
    
    private var addButton: some View {
          Button(action: {
              //self.presentAddBookSheet.toggle()
              
          }) {
            Image(systemName: "plus")
          }
        }//praivet add button
    
    
    
    
    
    var body: some View {
        
        NavigationView{
            List{
            
                          ForEach (viewModel.Vehicle) { vehicles in
                              HStack{
                              VStack(alignment: .leading) {
                                  Text(vehicles.VehicleMake)
                                      .fontWeight(.bold)
                                  Text(vehicles.VehicleModel)
                              }
                          }
                          }//HSTACK
            }//list
            
            
            .navigationTitle("My Garage")
            .navigationBarItems(trailing: addButton)
            .onAppear() {
                      print("BooksListView appears. Subscribing to data updates.")
                     // self.viewModel.subscribe()
                    }
                
        }//nav
        
        
        
        
    }//body1
}//structView

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
