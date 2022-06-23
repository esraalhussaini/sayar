//
//  AuthViewModel.swift
//  sayar
//
//  Created by anwar on 20/11/1443 AH.
//
import Firebase
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

final class AuthViewModel: ObservableObject {
    
    @Published var isAouthenticatting = false
    @Published var car : Car?
  
    
    static let shared = AuthViewModel()
    init(){
        fetchCar()
    }
    
    func fetchCar(){
        guard let uid = Auth.auth().currentUser?.uid  else {
            
            print("No user")
            return}
        Firestore.firestore().collection("Car").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else{
                print("No data")
                return
            }
            self.car = Car(dictionary: data)
            self.isAouthenticatting = true
            print(self.car?.carMake,"❤️")
        }
        
    }
//    func uploadCar(completion:@escaping ()->()){
////        guard let user =  AuthViewModel.shared.user else {return}
////            guard cost != 0.0 else {
////                print("Please, type something")
////                return}
//
//        let docRef = Firestore.firestore().collection("Car")
//        let data : [String:Any] = [
//            Car.carID : "123",
//            Car.id : "111",
//            car.carMake : self.car?.carMake,
//            Car.carModel :self.car?.carModel,
//            Car.carManufactureYear: self.car?.carManufactureYear,
//            Car.carKm : self.car?.carKm,
//            Car.carImageUrl : self.car?.carImageUrl,
//        ]
//        docRef.setData(data){ _ in
//            print("Uploading Successfully")
//            completion()
//        }
//    }
//
//
    
}




