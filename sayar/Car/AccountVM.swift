//
//  AccountVM.swift
//  sayar
//
//  Created by anwar on 22/12/1443 AH.
//

//import Foundation
////
////  AccountViewModel.swift
////  sayar
////
////  Created by anwar on 22/12/1443 AH.
////
//
//
//import Foundation
//import SwiftUI
//import Firebase
//import UIKit
//
//final class AccountVM : ObservableObject{
//    
//    @Published  var phoneNumber : String = ""
//    @Published var user : User?
//   //-------------------------------
//    @Published var carMake : String = ""
//    @Published var carModel : String = ""
//    @Published var carManufactureYear : Int = 0
//    @Published var carKm : Int = 0
//
//    @Published var imageUser: UIImage?
//    
// 
//    @Published var carDefaultImage = Image("Cardefault")
//    //why?
//    @Published var imageURL : String = ""
//    
//    @Published var car : Car?
//    
////    @Published var firstName : String = ""
////    @Published var lastName : String = ""
////    @Published var avatarImage = Image("default-avatar")
////    @Published var avatarUIImage : UIImage?
//    @Published var isShowingImagePicker = false
////    @Published var imageURL : String = ""
//    @Published var isLoading : Bool = false
// //   @Published  var user : User?
//    var authViewModel = AuthViewModel.shared
//    
//    
//    
//    init(){fetchProfile()}
//
//    func fetchProfile (){
//       // fetchUser {
//    fetchCar {
//            self.carMake  = self.car?.carMake  ?? ""
//            self.carModel = self.car?.carModel ?? ""
//            self.carManufactureYear = self.car?.carManufactureYear ?? 0
//            self.carKm = self.car?.carKm ?? 0
//            self.imageURL = self.car?.CarImage ?? ""
//            self.phoneNumber = self.user?.phoneNumber ?? ""
//            
//            
//            
//        
//        }
//        
//        
//        
//    }
//    
//    
//    func updateProfile(){
//        // CHALLENGE
//    }
//    
//    func fetchCar(completion:@escaping(()->())){
//       // CHALLENGE
//    }
//    
//    
////    func isValidProfile()->Bool{
////        guard !self.firstName.isEmpty,!self.lastName.isEmpty
////        else {return false}
////        return true
////    }
//    
//    
//    func loadImage (){
//        guard let imageUser=imageUser else {
//            return}
//        self.imageURL = ""
//        self.carDefaultImage = Image(uiImage: imageUser)
//    }
//
//    
//    private func showLoadingView(){isLoading = true}
//    private func hideLoadingView(){isLoading = false}
//    
//    
//
//}
//
//
