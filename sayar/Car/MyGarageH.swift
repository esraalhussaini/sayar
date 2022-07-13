//
//  MyGarage.swift
//  sayar
//
//  Created by Hadeel Altamimi on 13/06/2022.
//

import SwiftUI


struct MyGarageH: View {
    
//    @State var name: String = ""
    
    @StateObject var vm = addCarViewModel()
  
    private func CarRowView(car: Car) -> some View {
          NavigationLink(destination: CarDetailsView()) {
            VStack(alignment: .leading) {
                HStack {
                    Image("TabIconCar")
                    .resizable().frame(width: 65, height: 65).clipShape(Circle())
                     
                    VStack(alignment: .leading) {
                        Text(car.carMake)
                            .fontWeight(.bold)
                        Text(car.carModel)
                    }
                }
            }
          }
        }
    
    var body: some View {
        
        
        Text("BJHBJHBHJB")
//        List {
//            ForEach (vm.car) { Car in
//                CarRowView(car: <#T##Car#>)
//            }//for
//        }//LIST
//


     
                     .navigationTitle("My Garage")
                     .navigationBarTitleDisplayMode(.inline)
                    .onAppear() {
                              print("BooksListView appears. Subscribing to data updates.")
                              self.vm.fetchData()
                            }
        //

    



         
             
     

    
    
    
    
     
        
        
//
//        Text("")
//
//
//
//   //navgation bar
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                Button(action: {}) {
//                Image(systemName: "plus")
//                .resizable()
//                .foregroundColor(Color("ColorApp")) }
//                }
//    }
//            .navigationTitle("My Garage")
//            .navigationBarTitleDisplayMode(.inline)
        

        
    }
}

struct MyGarage_Previews: PreviewProvider {
    static var previews: some View {
        MyGarageH()
    }
}
