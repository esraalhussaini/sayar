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
                    .fill(Color("TabMyCar"))
                    .frame( width: 400,   height:341)
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
                               .font(.title2)
                               .fontWeight(.medium)
                               .offset(x: -115, y: 10)
                         

            }

            
                       HStack{

                           Text("-- km")
                      
                               .fontWeight(.light)
                               .foregroundColor(Color.gray)
                               .offset(x: 118, y: 10)
                               Image("penKM")
                               .offset(x: 120, y: 10)
            }

                
            
            
            
            
            
       //  ---------------
            
            
    
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color("TabMyCar"))
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -105,y:33)
                        Image("IconFuel")
                            .offset(x: -104, y:33)
                            .font(.body)
                    }
                    Text("Fuel")
                        .font(.title3)
                        .fontWeight(.medium)
                        .offset(x: -95, y:30)
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
                    .fill(Color("TabMyCar"))
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -70,y:33)
                        Image("IconOil")
                            .offset(x: -70, y:33)
                            .font(.body)
                    }
                    Text("Oil")
                        .font(.title3)
                        .fontWeight(.medium)
                        .offset(x: -61, y:20)
                    
                    
                    ZStack{
                    Rectangle()
                        .fill(Color("ColorOilOpa"))
                        .frame( width: 75,   height:25)
                        .shadow(radius: 10)
                        .cornerRadius(8)
                      
                        .offset(x: -94, y:49)
                        Text("N/A")
                     
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(Color("ColorOil"))
                            .offset(x: -94, y:49)
                    }
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 55, y:30)
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 2
            
            .offset(x: -2, y:84)
            
            
            
            
            //Group3
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color("TabMyCar"))
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -60,y:33)
                        Image("IconTiers")
                            .offset(x: -60, y:33)
                            .font(.body)
                    }
                    Text("Tiers")
                        .font(.title3)
                        .fontWeight(.medium)
                        .offset(x: -50, y:20)
                    
                    
                    ZStack{
                    Rectangle()
                        .fill(Color("ColorTiersOpa"))
                        .frame( width: 75,   height:25)
                        .shadow(radius: 10)
                        .cornerRadius(8)
                      
                        .offset(x: -104, y:49)
                        Text("N/A")
                     
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(Color("ColorTiers"))
                            .offset(x: -104, y:49)
                    }
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 45, y:30)
                }//HSTA
                
                
            }//VSATCK
            
            }//Groupn 3
            
            .offset(x: -2, y:165)
            
            
            
            
            
            
            
            
            
           //group 4
            
            
            
            Group{
            VStack{
                
                Rectangle()
                    .fill(Color("TabMyCar"))
                   
                    .frame( width: 340,   height:69)
                    .shadow(radius: 8)
                    .cornerRadius(16)
                    .offset(x: 1, y: 100)
                
                
                HStack{
                        
                    ZStack{
                   Image("trangle")
                            .offset(x: -50,y:33)
                        Image("IconBattery")
                            .offset(x: -50, y:33)
                            .font(.body)
                    }
                    Text("Battery")
                        .font(.title3)
                        .fontWeight(.medium)
                        .offset(x: -40, y:20)
                    
                    
                    ZStack{
                    Rectangle()
                        .fill(Color("ColorBatteryOpa"))
                        .frame( width: 75,   height:25)
                        .shadow(radius: 10)
                        .cornerRadius(8)
                      
                        .offset(x: -114, y:49)
                        Text("N/A")
                     
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(Color("ColorBattery"))
                            .offset(x: -114, y:49)
                    }
                        //.font(.bold)
                    Image("chevron")
                           .offset(x: 35, y:30)
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
