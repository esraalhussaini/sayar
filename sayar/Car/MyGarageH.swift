//
//  MyGarage.swift
//  sayar
//
//  Created by Hadeel Altamimi on 13/06/2022.
//

import SwiftUI
import Kingfisher
import UIKit




struct MyGarageH: View {
    @StateObject var addCarViewModel = AddCarViewModel()
  //  @StateObject var prifileViewModel = AccountVM()
    @EnvironmentObject var authViewModel : AuthViewModel
//    let CarMake = authViewModel.car?.carModel
    var body: some View {
        ZStack{
        
            VStack{
                ZStack(alignment: .topTrailing){
                    
                    
                    
                    
         
                        HStack(spacing:16){
                            ZStack{
//                                AvatarImage(size: 84,image: prifileViewModel.avatarImage)
                                KFImage(URL(string: authViewModel.car?.CarImage ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 84, height: 84)
                                    .clipShape(Circle())
                            }
                            .padding(.leading,-77)
//                            .onTapGesture {
//                                self.prifileViewModel.isShowingImagePicker.toggle()
//                            }
//
                            VStack(alignment: .trailing, spacing: 20){
//                                \(authViewModel.shared.car?.carModel)"
                                Text( authViewModel.fetchCarModel() ?? "Car")
                                    .font(.system(size: 32))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.75)
                             
                            }
                            .padding(.trailing,16)
                        }
                        .padding()
//                        .background(
//                            ZStack{
////                                Rectangle()
////                                    .cornerRadius(18)
////                                    .foregroundColor(Color.gray)
//                                    //.edgesIgnoringSafeArea(.bottom)
//                          
//                                  //  .offset(x: 172,y:-64)
//                            })
                    }
                 
//                    HStack(spacing:16){
//                        ZStack{
//
//
//                              KFImage(URL(string:prifileViewModel.imageURL))
//                                  .resizable()
//                                  .scaledToFill()
//                                  .frame(width: 40, height: 40)
//                                  .clipShape(Circle())
////
////                            HStack{
////
////                              ZStack{
//
////                                       AvatarImage(size: 84,image: prifileViewModel.carDefaultImage)
////
////            //  }
////
////                                   KFImage(URL(string: authViewModel.car?.CarImage ?? ""))
////                                      .resizable()
//////
////                                      .frame(width: 50, height: 50)
////                                  .clipShape(Circle())
////                                  .padding(.trailing)
////
////                              }
////
//
//                            }//zStack

//                    .padding(.leading,12)
//
//                        .onTapGesture {
//                            self.prifileViewModel.isShowingImagePicker.toggle()
//                        }
//
//
//                        VStack(spacing:1){
//                            TextField("My Car", text:$addCarViewModel.carMake) .font(.system(size: 32,weight: .bold))
//                                .lineLimit(1)
//                                .minimumScaleFactor(0.75)
//
//                        }
//                        .padding(.trailing,16)
//                        }
//                        .padding()

//
//                    }//hstack
                    
                Spacer()
           //
           //
                       }//vstack
                    
                        
                        
//                   VStack(alignment: .leading, spacing: 10){
//                           TextField("My Car", text:$addCarViewModel.carMake)
//                           .font(.title3)
//                          // .fontWeight(.medium)
//
////                                .font(.system(size: 32,weight: .bold))
////                                .lineLimit(1)
////                                .minimumScaleFactor(0.75)
//
//                        }
//                        .padding(.trailing,16)
//                    }
//                    .padding()
//
//
//                }
//                Spacer()
//
////
//            }//vstack
            
            
//
//
//            if prifileViewModel.isLoading{
//                LoadingView()
//            }
//
      //
            
        }
        .navigationBarTitle(LocalizedStringKey("MyGarage"), displayMode: .inline)
         
//            .toolbar{
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    saveButton
//                }
//            }
//            .sheet(isPresented: $prifileViewModel.isShowingImagePicker) {
//                prifileViewModel.loadImage()
//            } content: {
//              // ImagePicker(image: $prifileViewModel.avatarUIImage)
//            }
            .onAppear {
          

              

                    authViewModel.fetchCar{

                  }
         

                
//
//               prifileViewModel.fetchProfile()
            }
    }
//
//    var saveButton : some View {
//        Button {
//            prifileViewModel.updateProfile()
//        } label: {
//            Text("Save")
//            .foregroundColor(.red)
//        }
//    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            MyGarageH()
        } else {
            // Fallback on earlier versions
        }
    }
}

//
//struct EditImage: View {
//    var body: some View {
//        Image(systemName: "square.and.pencil")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 14, height: 14)
//            .foregroundColor(.white)
//            .offset(y: 30)
//    }
//}




//
//    HStack(spacing:16){
//        ZStack{
//
//            KFImage(URL(string:prifileViewModel.imageURL))
//                .resizable()
//                .scaledToFill()
//                .frame(width: 40, height: 40)
//                .clipShape(Circle())
//        }
//        .padding(.leading,12)
//        .onTapGesture {
//            self.prifileViewModel.isShowingImagePicker.toggle()
//        }
//
//



//
//VStack(spacing:1){
//    TextField("First Name", text: $prifileViewModel.firstName) .font(.system(size: 32,weight: .bold))
//        .lineLimit(1)
//        .minimumScaleFactor(0.75)
//
//}
//.padding(.trailing,16)
//}
//.padding()


//    .background(
//        ZStack{
//            Rectangle()
//                .cornerRadius(18)
//                .foregroundColor(Color.brandDarkGray)
//                .edgesIgnoringSafeArea(.bottom)
//            EditImage()
//                .offset(x: 172,y:-64)
//        })
