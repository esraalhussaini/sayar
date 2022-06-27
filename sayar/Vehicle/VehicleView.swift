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
    @State var presentAddCarSheet = false
    private var addButton: some View {
         Button(action: { self.presentAddCarSheet.toggle() }) {
           Image(systemName: "plus")
         }
       }
        
       private func carRowView(v: Vehicle) -> some View {
        // NavigationLink(destination: VehicleDetailsView(v: v)) {
           VStack(alignment: .leading) {
               HStack {
              
                    
                   VStack(alignment: .leading) {
                       Text(v.VehicleMake)
                   
                   }
               }
           }
         }
      // }nav
      
        
//       private func carRowView(v: Vehicle) -> some View {
//         NavigationLink(destination: VehicleDetailsView()) {
//
//
//
//                   VStack(alignment: .leading) {
//                       Text(v.VehicleMake)
//                           .fontWeight(.bold)
//                      // Text(v.VehicleModel)
//                   }//vstack
//
      
  
    
    
    var body: some View {
        
        NavigationView{
            
            List {
                     ForEach (viewModel.vehicle) { v in
                       carRowView(v: v)
                     }
//                     .onDelete() { indexSet in
//                       viewModel.removeBooks(atOffsets: indexSet)
//                     }
                   }
//            List(viewModel.vehicle){f in
//
//                    HStack{
//
//
//                        VStack(alignment: .leading, spacing: 10){
//
//
//                            Text("\(f.VehicleMake)").fontWeight(.heavy)
//                                .foregroundColor(.black)
//                            Text("\(f.VehicleModel)")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//
//                        }
//                        Spacer(minLength: 5)
//                        Text("\(f.VManufactureYear)")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                            .padding(.top)
//
//
//
//
//
//                    }.padding().background(Color("Grey"))
//                    .cornerRadius(10)
//
//
//
//
//
//
//
//
//            }//list
            
            .navigationTitle("My Garage")
            .navigationBarItems(trailing: addButton)
            .onAppear() {
                      print("BooksListView appears. Subscribing to data updates.")
                     self.viewModel.fetchData()
                    }
            .sheet(isPresented: self.$presentAddCarSheet) {
                VehicleEditView()
                    }
                
        }//nav
        
     

        
    }//body1
}//structView

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
