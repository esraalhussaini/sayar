//
//  CarDetailsView.swift
//  sayar
//
//  Created by anwar on 14/12/1443 AH.
//

import SwiftUI

struct CarDetailsView: View {
    
  var car: Car
    
      @EnvironmentObject var vImage: ViewModel
      

    
    
    var body: some View {
        
        ZStack{
            
            Color.gray.opacity(0.1)
         
        
//                        Image("DefualtCar")
//                //button
//                        Text("Add Photo")
//
          
            
            
            
        VStack(alignment: .center , spacing: 10){
            Form{
            

                //image
              //  Color.gray.opacity(0.1)
            VStack{
               
                    if let image = vImage.image {
            
                        ZoomableScrollView {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                           
                        }
                    } else {
                        Image("DefualtCar")
                       // Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.6)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                    HStack {
                        Button {
                        

                                   
                            vImage.source = .camera
                            vImage.showPhotoPicker()
                        } label: {
                            Text(LocalizedStringKey("Camera"))
                        }
                        Button {
                            

                       
                            vImage.source = .library
                            vImage.showPhotoPicker()
                        } label: {
                            Text(LocalizedStringKey("Photos"))
                        }
                    }
                    Spacer()
            }//vstack image
                
                
          
        
                
                
                
                
                
                
                
            
  
                
                
                
                
             
          
           // VStack(alignment: .leading) {
            
                Section{
            
                   Text("\(car.carMake)Make")
                  
                    Text("\(car.carModel)Model")
                    
                }
          
                    Section{
            Text(LocalizedStringKey("\(car.carManufactureYear)carManufactureYear"))
                      
                        .keyboardType(.numberPad)
            Text(LocalizedStringKey("\(car.carKm)km"))
                      
                                .keyboardType(.numberPad)
                       
                       
                            
                        }

     
            }//form
               


                
Spacer()
           
                        
                 
            
         
           }//VSTACK
         

        }//zstack importent

        
        
        
        

    
    

        
        

    }
}





//

//struct CarDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
////array
//
//
//   // CarDetailsView(car: Car)
//            CarDetailsView(car: <#Car#>)
//      
//    }
//}
