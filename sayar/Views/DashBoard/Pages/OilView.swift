//oilView
//
//  OilView.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import SwiftUI

struct OilView: View {
    @EnvironmentObject var vm : OilViewModel
    @State var isPresentedNewPost = false
    @State var km = ""

    var body: some View {
        VStack{
            List{
                ForEach(vm.oil){ oil in
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text("\(oil.cost)").fontWeight(.heavy)
                                .foregroundColor(.black)
                                .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
                            Text("\(oil.km)")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
                                
                        }
                        Spacer(minLength: 5)
                        Text("\(oil.date)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.top)
                            .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
    
                    }.padding().background(Color("Grey"))
                    .cornerRadius(10)
                    
                }
                .onDelete(perform: vm.deleteOil)
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
        .onAppear{
            vm.fetchData()
        }
        
        
        
        
        
        
        
 //Navgation Titel
     .navigationTitle("Oil")
        .navigationBarTitleDisplayMode(.inline)
        .font(.title2)
        
        
        
        
        
        
    
//---------Sheet
    
    .sheet(isPresented: $isPresentedNewPost, content: {
        
        AddOilView(isPresented: $isPresentedNewPost)
        
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









