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
    @State var showNoCarAlert = true
    @EnvironmentObject var authvm : AuthViewModel
    var body: some View {
        VStack{
            List{
                ForEach(vm.oil){ oil in
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                        Text("\(AuthViewModel.shared.formateNumber(double: oil.cost))Sr").fontWeight(.heavy)
                                .foregroundColor(.black)
//                                .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
//                            AuthViewModel.shared.formateNumber(double: oil.cost)
                            Text("\(oil.km)KM")
                                .font(.caption)
                                .foregroundColor(.gray)
//                                .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
                                
                        }
                       // Spacer(minLength: 5)
                        Spacer()
                        Text("\(AuthViewModel.shared.formatedDate(date:oil.date))")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .offset(y: -30)
                        
                      
                            
//                            .swipeActions{Button("Delete"){ print("Deleted")} .tint(.red) }
    
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
    
    
    
        
        
    .alert("you did not add a car yet", isPresented: $showNoCarAlert) {
        Button("OK", role: .cancel) { }
    }
 
    
    }//var body 1



       

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

struct OilView_Previews: PreviewProvider {
    static var previews: some View {
        OilView()
    }
}









