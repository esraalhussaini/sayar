//
//  BatteryView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct BatteryView: View {
    @EnvironmentObject var vm : BatteryViewModel
    @State var isPresentedNewPost = false
    @State var showNoCarAlert = true
    @EnvironmentObject var authvm : AuthViewModel
    
    var body: some View {
        
        VStack{
            List{
                ForEach(vm.battery){ battery in
                    
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text("\(AuthViewModel.shared.formateNumber(double:battery.cost))SR").fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("\(battery.km)KM"))
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer()
                    Text("\(AuthViewModel.shared.formatedDate(date:battery.date))")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .offset(y: -30)
                    
                    
                    
                    
                    
                }.padding().background(Color("Grey"))
                .cornerRadius(10)
                
                }
                .onDelete(perform: vm.deleteBattery)
          
         
                
                
                
                
        }//LIST

        
        
        .toolbar{
Button {
    isPresentedNewPost = true
} label: {
plusBottonOil

}
        }//TOOLBAR
            }
.font(.title2)//button  plus
.accentColor(.red)//button   plus
.onAppear{
    vm.fetchData()
}






//Navgation Titel
.navigationTitle(LocalizedStringKey("Battery"))
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

    AddBatteryView(isPresented: $isPresentedNewPost)

})


            
            
          
.alert(LocalizedStringKey("youdidnotaddacaryet"), isPresented: $showNoCarAlert) {
    Button(LocalizedStringKey("OK"), role: .cancel) { }
}
    
    
    }//body1





//Button Pluse
var plusBottonOil: some View {
    
    
    
    Button(action: {
        if authvm.thereIsACar{
    isPresentedNewPost.toggle()
        }
        else
        {
            showNoCarAlert.toggle()
        }
    }, label:  {
        
        Image(systemName: "plus")
            .font(.title3)
   
    })
    
    
    
    
}//VarBody2




}//strct
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

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView()
    }
}
