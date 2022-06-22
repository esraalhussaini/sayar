//
//  OilView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct OilView: View {
    @StateObject var vm = OilViewModel()
    
    
    //Pluse button
    
    
    @State var isPresentedNewPost = false
    @State var titel = ""
    @State var post = ""
     @State  var kmCar  = ""
    
    
   //Razan Search
    @State private var searchText = ""

    var body: some View {
        
  
        
        
        
        
        
        
        
        
        
        
        VStack{
        
            
            List(vm.oil){f in
                VStack{
                    Text("\(f.cost)")
                    Text("\(f.km)")
                    Text("\(f.date)")
                }
              
                
            }
            
            
                .toolbar{
     Button {
            isPresentedNewPost = true
    } label: {
        plusBottonOil
     
    }
                }//TOOLBAR
        }//vastack
        .font(.title2)//button  plus
        .accentColor(.red)//button   plus
        
        
        
        
        
        
        
 //Navgation Titel
     .navigationTitle("Oil")
        .navigationBarTitleDisplayMode(.inline)
        .font(.title2)
        
        
        
        
        
        
    
//---------Sheet
    
    .sheet(isPresented: $isPresentedNewPost, content: {
        
        AddOilView(isPresented: $isPresentedNewPost, titel: $titel, post: $post,kmCar: $kmCar)
        
    })
    
    
    
        
        
        
 
    
    }//var body 1





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

struct OilView_Previews: PreviewProvider {
    static var previews: some View {
        OilView()
    }
}










