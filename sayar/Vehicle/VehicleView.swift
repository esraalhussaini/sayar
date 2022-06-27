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
            
            
            List(viewModel.vehicle){f in
              
                    HStack{
                        
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            
                            Text("\(f.VehicleMake)").fontWeight(.heavy)
                                .foregroundColor(.black)
                            Text("\(f.VehicleModel)")
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                        }
                        Spacer(minLength: 5)
                        Text("\(f.VManufactureYear)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        
                        
                        
                        
                    }.padding().background(Color("Grey"))
                    .cornerRadius(10)
                    
                    
              
             
                    
                    
                    
                    
            }//list
            
            .navigationTitle("My Garage")
            .navigationBarItems(trailing: addButton)
            .onAppear() {
                      print("BooksListView appears. Subscribing to data updates.")
                     //self.viewModel.fetchData()
                    }
                
        }//nav
        
     

        
    }//body1
}//structView

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
