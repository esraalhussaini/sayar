import SwiftUI

struct FuelView: View {
    @EnvironmentObject var vm :  FuelViewModel
    @State var isPresentedNewPost = false
    @State var showNoCarAlert = true
    @EnvironmentObject var authvm : AuthViewModel
    @State  var km  = ""
    
    var body: some View {
        
        
        
        List{
          
            ForEach(vm.fuel){ fuel in
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text(LocalizedStringKey("\(AuthViewModel.shared.formateNumber(double:fuel.cost)) SAR")).fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("\(fuel.km) KM"))
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer()
                    Text("\(AuthViewModel.shared.formatedDate(date: fuel.date))")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .offset(y: -30)
                    
                    
                    
                    
                    
                    
                }.padding().background(Color("Grey"))
                .cornerRadius(10)
               // .onDelete(vm.deleteFuel(fuel: fuel))

            }
            .onDelete(perform: vm.deleteFuel)
               
                
                
          
         
                
                
                
                
        }
        
        .toolbar{
Button {
    isPresentedNewPost = true
} label: {
plusBottonOil

}
        }//TOOLBAR

.font(.title2)//button  plus
.accentColor(.red)//button   plus
.onAppear{
    vm.fetchData()
}






//Navgation Titel
.navigationTitle(LocalizedStringKey("Fuel"))
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

    AddFuelView(isPresented: $isPresentedNewPost)

})
.alert(item: $vm.appError) { alert in
    Alert(title: Text(""), message: Text("\(alert.localizedDescription)"))
}

            
            
          
    
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


struct FuelView_Previews: PreviewProvider {
    static var previews: some View {
        FuelView()
        
        
    }
}

