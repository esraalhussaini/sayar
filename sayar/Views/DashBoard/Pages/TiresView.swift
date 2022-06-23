//
//  TiersView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct TiresView: View {
    @StateObject var vm = TiresViewModel()


    //Pluse button
    @State var isPresentedNewPost = false
    @State  var DATE = Date()
    @State var cost = ""
    @State var TiersYearRelease = ""
    @State  var ExpectedTime  = ""
    var body: some View {
      
            
            
        List(vm.tires){f in
          
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        
                        Text("\(f.cost)").fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("\(f.km)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                    Spacer(minLength: 5)
                    Text("\(f.date)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    
                    
                    
                    
                }.padding().background(Color("Grey"))
                .cornerRadius(10)
                
                
          
         
                
                
                
                
        }//list
        
        
        .toolbar{
Button {
    isPresentedNewPost = true
} label: {
plusBottonOil

}
        }//TOOLBAR

.font(.title2)//button  plus
.accentColor(.red)//button   plus







//Navgation Titel
.navigationTitle("Tires")
.navigationBarTitleDisplayMode(.inline)
.font(.title2)







//---------Sheet

.sheet(isPresented: $isPresentedNewPost, content: {

AddTierView(isPresented: $isPresentedNewPost, DATE: $DATE, cost: $cost,  TiersYearRelease: $TiersYearRelease, ExpectedTime: $ExpectedTime)

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
