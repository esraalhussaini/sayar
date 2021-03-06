//
//  TiersView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct TiresView: View {
    @EnvironmentObject var vm : TiresViewModel
    @State var isPresentedNewPost = false
    @State var showNoCarAlert = true
    @EnvironmentObject var authvm : AuthViewModel
//
    var body: some View {
      
            
        VStack{
            List{
                ForEach(vm.tires){ tires in
                    HStack{
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text(LocalizedStringKey("\(AuthViewModel.shared.formateNumber(double:tires.cost))  SAR")).fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(LocalizedStringKey("\(tires.km)KM"))
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer()
                    Text("\(AuthViewModel.shared.formatedDate(date:tires.date))")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .offset(y: 18)
                    
                    
                    
                    
                    
                }.padding().background(Color("Grey"))
                .cornerRadius(10)
                
                    }
                }
                .onDelete(perform: vm.deleteTires)
          
         
                
                
                
                
        }//list
        
        
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


.listStyle(.plain)




//Navgation Titel
.navigationTitle(LocalizedStringKey("Tires"))
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

AddTierView(isPresented: $isPresentedNewPost)

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

struct TiersView_Previews: PreviewProvider {
    static var previews: some View {
        TiresView()
            .environmentObject(TiresViewModel())

    }
}
