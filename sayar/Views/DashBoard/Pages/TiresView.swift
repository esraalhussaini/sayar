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
//
    var body: some View {
      
            
        VStack{
            List{
                ForEach(vm.tires){ tires in
                    HStack{
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text("\(tires.cost)").fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("\(tires.km)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer(minLength: 5)
                    Text("\(tires.date)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    
                    
                    
                    
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






//Navgation Titel
.navigationTitle("Tires")
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

AddTierView(isPresented: $isPresentedNewPost)

})


            
            
          
    
    
    
    }//body1





//Button Pluse
var plusBottonOil: some View {
    
    
    
    Button(action: {
        isPresentedNewPost.toggle()
    }, label:  {
        
        Image(systemName: "plus")
            .font(.title3)
   
    })
    
    
    
    
}//VarBody2




}//strct

struct TiersView_Previews: PreviewProvider {
    static var previews: some View {
        TiresView()
    }
}
