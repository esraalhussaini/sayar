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
    
//image
//    @Published var imageUser : UIImage?
//    var addCarViewModel2 = addCarViewModel.shared
    
    
        //@Published var :UIImage?
    //  @Published var imageUser: UIImage?
      //  @Published var defaultImageCar = Image("Cardefault")
          @Published  var  date  = Date()

    //---------
   @Published var userSession : Firebase.User?
  @Published var isAouthenticatting = false
  @Published var car : Car?

    //-----
  static let shared = AuthViewModel()
  private var db = Firestore.firestore()
  init(){

    if let _ = Auth.auth().currentUser {
      isAouthenticatting = true
      fetchCar {

      }

    }//if
    // fetchCar()
  }//intit


  var thereIsACar : Bool{
    guard let id = car?.id else {
      return false
    }

    return true

  }

  func fetchCar(completion:@escaping()->()){
    guard let uid = Auth.auth().currentUser?.uid else {
      print("No user")
      return}
    Firestore.firestore().collection("Car").document(uid).getDocument { snapshot, _ in
      guard let data = snapshot?.data() else{
        print("No data")
        return
      }
      self.car = Car(dictionary: data)
      //self.isAouthenticatting = true
      print(self.car?.carMake)
      completion()
    }


   //------end Anwar
      
  

  }//fetchCar

    
    
    //image
  
    
    //------
    
    
    
    
    
    
    
    
    
    
    
  func updateKilometers(newKm: Double){
    guard let uid = Auth.auth().currentUser?.uid else {return}
    let x = db.collection("Car").document(uid).documentID
    db.collection("Car").document(x).updateData(["CarKM":newKm])
  }

    func formatedDate(date:Date)->String{
        
//        let expDate = calculateExpiredDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }

//    func formateNumber(double: Double)-> NSString {
//        let formatter = NumberFormatter()
//                formatter.numberStyle = .decimal
//                formatter.maximumFractionDigits = 2
//        return NSString(formatter)
//    }
//    func formateNumber(double: Double)-> Formatter{
//        let formatter = NumberFormatter()
//                formatter.numberStyle = .decimal
//                formatter.maximumFractionDigits = 2
//        return formatter
//    }
    func formateNumber(double: Double)-> String{
            let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.maximumFractionDigits = 2
        return formatter.string(from: double as NSNumber) ?? ""
        }

  //singout
  @Published var user : User?

  func handleSignout (){
    try? Auth.auth().signOut()
    self.isAouthenticatting.toggle()
    self.user=nil
  }


}//class




//  func uploadCar(completion:@escaping ()->()){
////    guard let user = AuthViewModel.shared.user else {return}
////      guard cost != 0.0 else {
////        print(“Please, type something”)
////        return}
//
//    let docRef = Firestore.firestore().collection(“Car”)
//    let data : [String:Any] = [
//      Car.carID : “123",
//      Car.id : “111”,
//      car.carMake : self.car?.carMake,
//      Car.carModel :self.car?.carModel,
//      Car.carManufactureYear: self.car?.carManufactureYear,
//      Car.carKm : self.car?.carKm,
//      Car.carImageUrl : self.car?.carImageUrl,
//    ]
//    docRef.setData(data){ _ in
//      print(“Uploading Successfully”)
//      completion()
//    }
//  }
//
//
