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
    
    //    @Published var isLoading : Bool = false
    //image
    //    @Published var imageUser : UIImage?
    //    var addCarViewModel2 = addCarViewModel.shared
    
    
    //@Published var :UIImage?
    //  @Published var imageUser: UIImage?
    //  @Published var defaultImageCar = Image("Cardefault")
    @Published  var  date  = Date()
    
    //---------
    //@State var homePage = HomeCarViewModel()
    @Published var userSession : Firebase.User?
    @Published var isAouthenticatting = false
    @Published var car : Car?
    @Published var user : User?
    
    //-----
    static let shared = AuthViewModel()
    private var db = Firestore.firestore()
   
    init(){
        
        if let _ = Auth.auth().currentUser {
            self.userSignedIn()
        }else{
            //sign in anaymouslly
            signInAnonymously {
                self.userSignedIn()
            }
            
        }
        
        //if
        //      else {
        //          signInAnonymously{self.fetchCar {
        //
        //          }}
        //      }
        // fetchCar()
    }//intit
    
    func userSignedIn(){
        
        isAouthenticatting = true
        fetchCar {}
        
    }
    
    var authUser: Firebase.User? {
        Auth.auth().currentUser
        
    }
    func fetchCarModel()->String?{
        //        if self.thereIsACar {
        
        guard let car = car else {return nil}
        return (car.carModel)
    }
    var thereIsACar : Bool {
        guard let id = car?.id else {
            return false
        }
        
        return true
        
    }
    
    func fetchCar(completion:@escaping()->()){
      
//        guard let uid = user?.id else {
//            print("No user")
//            return}
        guard let uid = Auth.auth().currentUser?.uid else {
            print("No user")
            return}
        
        
        
        //        Firestore.firestore().collection("Car").document(uid).getDocument { snapshot, _ in

        Firestore.firestore().collection("Car").whereField(Car.userId, isEqualTo: uid).getDocuments { snapshot, error in
        
            guard error == nil else {
                print("\(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let cars = snapshot?.documents else{
                print("No data")
                return
            }
            if let car = cars.first?.data() {
                self.car = Car(dictionary: car)
                ///self.isAouthenticatting = true
                //print(self.car?.carMake)
            }
            completion()
        }
        
        
        //------end Anwar
        
        
        
    }//fetchCar
    
    
    
    //image
    
    
    
    //    var isSignedUser.bool
    //    init() {
    //        if let uid = UIDevice.current.identifierForVendor?.uuidString {
    //            print(uid)
    //        }
    //
    func signInAnonymously(completion:@escaping()->()){
        
        Auth.auth().signInAnonymously { authResult, error in
            if error == nil && authResult?.user != nil {
                self.fetchAnonymousUser { user in
                    if let user = user {
                        self.user = user
                        completion()
                    }
                    //UIDevice.current.identifierForVendor?.uuidString
                    
                    else if let userId = Auth.auth().currentUser?.uid {
                        //authResult?.user.uid
                        let userId = userId
                        
                        let userData = [
                            "id": userId,
                            
                        ]
                        
                        Firestore.firestore().collection("users").document(userId).setData(userData)
                        self.user = User.init(data: userData)
                        completion()
                    }
                }
                //     TODO create new user with deviceId
                
                //            self.isAouthenticatting = true
                //            completion()
            }
            //        if  let uid = UIDevice.current.identifierForVendor?.uuidString {
            
        }
        
    }
    
//    func createUserAccount(){
//        let uid = user?.id
//    }
    
    func fetchAnonymousUser(completion:@escaping(User?)->()){
        
        //UIDevice.current.identifierForVendor?.uuidString
        if let isAnonymous = Auth.auth().currentUser?.isAnonymous, isAnonymous == true {
            if let uid = Auth.auth().currentUser?.uid  {
                //            db.collection("User").deviceId
                db.collection("User").document(uid)
                //            whereField(User.deviceID, isEqualTo: uid).limit(to: 1)
                    .getDocument() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            if let data = querySnapshot?.data() {
                                //                             let data = document.data()
                                let user = User(data: data)
                                completion(user)
                                
                            }
                            
                            //                        for document in querySnapshot!.documents {
                            //                            print("\(document.documentID) => \(document.data())")
                            
                        }
                        completion(nil)
                    }
            }
            
        }
    }
    
    
    func updateKilometers(newKm: Double){
        guard let uid = self.user?.id else {return}
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
    
    
    func formateNumber(double: Double)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: double as NSNumber) ?? ""
    }
    
    //singout
    //    @Published var user : User?
    
    func handleSignout (completion:@escaping()->()){
        try? Auth.auth().signOut()
        self.car = nil
        
        self.isAouthenticatting.toggle()
        
        self.user=nil
        completion()
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

