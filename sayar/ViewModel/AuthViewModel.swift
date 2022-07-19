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
    
    let batteryCollection = "Battery"
    let fuelCollection = "Fuel"
    let oilCollection = "Oil"
    let tireCollection = "Tires"
    
   // @Published var userSession : Firebase.User?
    @Published var isAouthenticatting = false
    @Published var car : Car?
    //@Published var :UIImage?
    @Published var image: UIImage?
    static let shared = AuthViewModel()
    public var db = Firestore.firestore()
    init(){
        
        if let _ = Auth.auth().currentUser {
            isAouthenticatting = true
            fetchCar()
           
        }//if
       // fetchCar()
    }//intit
    
    
    var thereIsACar : Bool{
        guard  let id = car?.id else {
            return false
        }

        return true

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
            //self.isAouthenticatting = true
            print(self.car?.carMake,"❤️")
        }
        
      
        //anwar Image
        guard let uid =  Auth.auth().currentUser?.uid
        else    {return}
        let refe =  Storage.storage().reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5)
        else {return}
        refe.putData(imageData, metadata: nil) { _, error in
            if let error = error {
             print("error\(error)")
                return
            }
            //or
            print("Successfull Upload")
        }
      //------end Anwar

        
    }//fetchCar
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
    func updateKilometers(newKm: Double){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let x = db.collection("Car").document(uid).documentID
        db.collection("Car").document(x).updateData(["CarKM":newKm])
    }
    
    
    
    
    
    
    //singout
    @Published var user : User?
    
    func handleSignout (){
        try? Auth.auth().signOut()
        self.isAouthenticatting.toggle()
        self.user=nil
    }
    
    
}//class




