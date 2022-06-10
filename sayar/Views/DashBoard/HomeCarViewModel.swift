//
//  HomeCarViewModel.swift
//  sayar
//
//  Created by anwar on 02/11/1443 AH.
//

import SwiftUI

struct HomeCarViewModel: View {
    var body: some View {
        
        NavigationView{
           
  
        
        ZStack {
        
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame( width: 390,   height:341)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                   
            
              
                HStack{
                    Text("My Garage")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .offset(x: -90, y: -270)
                // .font(.bold)
                    
                           .navigationBarItems(trailing:
   
                                       HStack {
                                           Button(action: {}) {
                                               Image(systemName: "plus")
                                                   .font(.title)
                                           }.foregroundColor(.red)
                                   .offset(x: -1, y: -90)
                                       })
                    
                    
                }//HSTACK
   
                VStack{

                  
                Image("Cardefault")
                        .offset(x:2 , y:-240)

                }

             
                
                
                
                
    
                    

//                    .overlay()

                
              
                Spacer()
                
            }//vastack

            
                       HStack{

                           Text("Car Name")
                               .font(.title3)
                               .fontWeight(.semibold)
                               .offset(x: -120, y: 10)
                         

            }

            
                       HStack{

                           Text("--")
                               .font(.title3)
                               .fontWeight(.semibold)
                               .offset(x: 130, y: 10)
                               Image("pencil")
                               .offset(x: 133, y: 10)
            }

                
            
            
            
            
            
       //  ---------------
            
            
            
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color.blue)
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -105,y:33)
                        Image("Fule")
                            .offset(x: -104, y:33)
                            .font(.body)
                    }
                    Text("n njb")
                        .offset(x: -93, y:30)
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 90, y:30)
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 1
            
            .offset(x: -2, y:1)
            
            
            
            
            
         //group2
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color.blue)
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -105,y:33)
                        Image("Fule")
                            .offset(x: -104, y:33)
                            .font(.body)
                    }
                    Text("n njb")
                        .offset(x: -93, y:30)
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 90, y:30)
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 2
            
            .offset(x: -2, y:84)
            
            
            
            
            //Group3
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color.blue)
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -105,y:33)
                        Image("Fule")
                            .offset(x: -104, y:33)
                            .font(.body)
                    }
                    Text("n njb")
                        .offset(x: -93, y:30)
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 90, y:30)
                    
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 3
            
            .offset(x: -2, y:165)
            
            
            
            
            
            
            
            
            
           //group 4
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color.blue)
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -105,y:33)
                        Image("Fule")
                            .offset(x: -104, y:33)
                            .font(.body)
                    }
                    Text("n njb")
                        .offset(x: -93, y:30)
                        //.font(.bold)
                 Image("chevron")
                        .offset(x: 90, y:30)
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 4
            
            .offset(x: -2, y:249)
            
            
            
            
            
            
            
            
            
            
            
            
 

 
            
        }//Zstack//BIGG
 
        

        .edgesIgnoringSafeArea(.top)
        }//nav
        
        
        
      
    }
}

struct HomeCarViewModel_Previews: PreviewProvider {
    static var previews: some View {
        HomeCarViewModel()
    }
}
