//
//  FuelView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

//
// FuelView.swift
// sayar
//
// Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct FuelView: View {
  @StateObject var vm = FuelViewModel()
  // @State private var searchText = “”


    //Pluse button
    @State var isPresentedNewPost = false
   // @State var DATE = Date()
   // @State var cost = “”

    @State var km = ""
  var body: some View {



    List{

      ForEach(vm.fuel){ fuel in
        HStack{


          VStack(alignment: .leading, spacing: 10){


            Text("\(fuel.cost)").fontWeight(.heavy)
              .foregroundColor(.black)
            Text("\(fuel.km)")
              .font(.caption)
              .foregroundColor(.gray)

          }
          Spacer(minLength: 5)
          Text("\(fuel.date)")
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.top)





        }.padding().background(Color("Grey"))
        .cornerRadius(10)
        // .onDelete(vm.deleteFuel(fuel: fuel))

      }
      .onDelete(perform: vm.deleteFuel)









    }//list
//    .swipeActions(edge: .leading) {
//      Button(action: {
//        print(“do deleting”)
//        //vm.deleteFuel(fuel: <#T##Fuel#>)
//      }){
//       Image(systemName: “trash”)
//      }
//      .tint(.red)
//    }


    .toolbar{
Button {
  isPresentedNewPost = true
} label: {
plusBottonOil

}
    }//TOOLBAR

.font(.title2)//button plus
.accentColor(.red)//button  plus







//Navgation Titel
.navigationTitle("Fuel")
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

  AddFuelView(isPresented: $isPresentedNewPost)

})
.alert(item: $vm.appError) { alert in
  Alert(title: Text(""), message: Text("\(alert.localizedDescription)"))
}







  }//body1





//Button Pluse
var plusBottonOil: some View {



  Button(action: {
    isPresentedNewPost.toggle()
  }, label: {

    Image(systemName: "plus")
      .font(.title3)

  })




}//VarBody2




}//strct
 //Code RazN
//
////
//      HStack {
////       Text(“NJN”)
//
//    }//Hstack
////
//
//      // .navigationTitle(“My Garage”)
//      // .navigationBarTitleDisplayMode(.large)
//        .toolbar {
//          ToolbarItem(placement: .primaryAction) {
//            Button(action: {}) { Image(systemName: “plus”)
//                .resizable()
//              .foregroundColor(Color(“ColorApp”)) }
//          }
//
//  ToolbarItem(placement: .navigation) {
//    Button(action: {}) { Image(systemName: “chevron.left”)
//            .foregroundColor(Color(“ColorApp”)) }
//          }
//    }
//        .navigationTitle(“Battery”)
//        .navigationBarTitleDisplayMode(.inline)
//        .searchable(text: $searchText)
//
//
//
//
//    .background(Color.orange)
//    .ignoresSafeArea()


struct FuelView_Previews: PreviewProvider {
  static var previews: some View {
    FuelView()


  }
}
