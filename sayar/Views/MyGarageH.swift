//
//  MyGarage.swift
//  sayar
//
//  Created by Hadeel Altamimi on 13/06/2022.
//

import SwiftUI


struct MyGarageH: View {
    
//    @State var name: String = ""

    
    var body: some View {

//            VStack(alignment: .center){
                    

                                  
//                        ZStack{
//                        Rectangle()
//                            .fill(Color("TabMyCar"))
//
//                            .frame( width: 345,   height:69)
//                            .shadow(radius: 8)
//                            .cornerRadius(16)
//
//
//                        HStack{
//
//                            ZStack{
//                                Image("trangle")
//                                Image("IconFuel")
//                                    .font(.body)
//                            }
//                            VStack(alignment: .leading, spacing: 10){
//                            Text("Fuel")
//                                .font(.title3)
//                                .fontWeight(.medium)
//
//
//                            }
//
//
//                          Spacer()
//
//                            Image("chevron")
//
//                        }
//                        .padding(.horizontal,40)
//                       }//ZSTACK
//                        .padding(.top,60)
//                Spacer()
//
//
//                    }//Vstack
        

//        }//NAV
                       //.accentColor(.black)
            
        
    
    
    
    
     
        
        
        
        Text("")
        
        
        
   //navgation bar
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                Button(action: {}) {
                Image(systemName: "plus")
                .resizable()
                .foregroundColor(Color("ColorApp")) }
                }
    }
            .navigationTitle("My Garage")
            .navigationBarTitleDisplayMode(.inline)
        

        
    }
}

struct MyGarage_Previews: PreviewProvider {
    static var previews: some View {
        MyGarageH()
    }
}
