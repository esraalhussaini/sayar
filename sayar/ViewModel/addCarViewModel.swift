//
//  addCarViewModel.swift
//  sayar
//
//  Created by anwar on 24/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseStorage
//import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

//import FirebaseFirestore

class addCarViewModel: ObservableObject{
    
    //anwar
// @Published var car: Car
    //....
    
    @Published var car = [Car]()
    @Published var kmString : String = ""
    @Published var carManufactureYearString : String = ""
    @Published var carModelString : String = ""
    @Published var carMake : String = ""
    
    var km : Double{
        Double(kmString) ?? 0.0
    }
    var carManufactureYear : Double{
        Double(carManufactureYearString) ?? 0.0
    }
    
    var carModel : Double{
        Double(carModelString) ?? 0.0
    }
    init(){
        fetchData()
    }
//
//    @Published var list = [Fuel]()
//
//    func getData(){
//
//        //get a refrence to the database
        private var db = Firestore.firestore()
    
    func fetchData(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
//        let docRef = Firestore.firestore().collection("Car").document(uid)
//        db.collection("Car").document(uid).getDocuments
        db.collection("Car").document(uid).getDocument { snapshot, error in
            
            guard let data = snapshot?.data() else {return}
            let car = Car(dictionary: data)
        }
//        db.collection("Car").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                    let car = Car(dictionary: doc.data())
////                    print(fuel.cost,"🤚🏻")
//                    self.car.append(car)
//                }
//
//            }
//
//
//
//        }
        
//
        
    }

  
//    ********************* NOUF fule ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadCar(completion:@escaping ()->()){
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let docRef = Firestore.firestore().collection("Car").document(uid)
        
            let data : [String:Any] = [
               
                Car.id : docRef.documentID,
                Car.carMake : carMake,
                Car.carModel :carModel,
                Car.carManufactureYear: carManufactureYear,
                Car.carKm : km,
                Car.carImageUrl :"image test",
//                check the image from Anwar
            ]
            docRef.setData(data){ _ in
                print("added in \(docRef.documentID)")
                print("Uploading Successfully")
                completion()
                AuthViewModel.shared.updateKilometers(newKm:self.km)
            }
        
        
        
//        func persistImageToStorage() {
//
//            guard let uid = Auth.auth().currentUser?.uid else {return}
//
//            let ref = Storage.storage().reference(withPath: uid)
//
//            guard let imageData = avatarUIImage?.jpegData(compressionQuality: 0.5) else { return }
//
//            ref.putData(imageData, metadata: nil) { metadata, err in
//                if let err = err {
//                    print("Failed to push image to Storage: \(err)")
//                    self.hideLoadingView()
//                    return
//                }
//
//                ref.downloadURL { url, err in
//                    if let err = err {
//                        print("Failed to retrieve downloadURL: \(err)")
//                        return
//                    }
//                    print("Successfully stored image with url: \(url?.absoluteString ?? "")")
//
//                    guard let url=url else{return}
//                    userData[User.profileImageUrl]=url.absoluteString
//                    userData[User.id]=uid
//                    self.storeUserInformation(userData:userData)
//                    self.hideLoadingView()
//                    print("User has been created successfully")
//                }
//            }
//        }

        
        
        }
 

    
    
    
    //Anwar
    
//    private func addCar(_ car: Car) {
//      do {
//          let _ = try db.collection("Car").addDocument(data: car)
//      }
//      catch {
//        print(error)
//      }
//    }
//
//
    
}//class

//final class  RegistrationViewModel : ObservableObject{
//
//    @Published var firstName : String = ""
//    @Published var lastName : String = ""
//    @Published var email : String = ""
//    @Published var password : String = ""
//    @Published var avatarImage = Image("default-avatar")
//    @Published var avatarUIImage : UIImage?
//    @Published var isShowingImagePicker = false
//    @Published var imageURL : String = ""
//    @Published var isLoading : Bool = false
//    var authViewModel = AuthViewModel.shared
//    let users = "Users"
//
//
//    func isValidProfile()->Bool{
//        guard !self.firstName.isEmpty
//                ,!self.lastName.isEmpty
//                ,self.avatarImage != Image("default-avatar")
//                ,!self.email.isEmpty
//                ,!self.password.isEmpty
//
//        else {return false}
//
//        return true
//    }
//
//
//    func createUser(){
//        guard isValidProfile() else {
//            print("Invalid Profile")
//            return
//        }
//
//        var userData : [String:String] = [User.firstName:firstName
//                                          ,User.lastName:lastName
//                                          ,User.email:email]
//
//        self.showLoadingView()
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let _ = error{
//                print("Create Profile Failure")
//                self.hideLoadingView()
//                return
//            }
//            else{print("Successfully created user \( result?.user.uid ?? "")")}
//
//            persistImageToStorage()
//        }
//
//        func persistImageToStorage() {
//
//            guard let uid = Auth.auth().currentUser?.uid else { return }
//
//            let ref = Storage.storage().reference(withPath: uid)
//
//            guard let imageData = avatarUIImage?.jpegData(compressionQuality: 0.5) else { return }
//
//            ref.putData(imageData, metadata: nil) { metadata, err in
//                if let err = err {
//                    print("Failed to push image to Storage: \(err)")
//                    self.hideLoadingView()
//                    return
//                }
//
//                ref.downloadURL { url, err in
//                    if let err = err {
//                        print("Failed to retrieve downloadURL: \(err)")
//                        return
//                    }
//                    print("Successfully stored image with url: \(url?.absoluteString ?? "")")
//
//                    guard let url=url else{return}
//                    userData[User.profileImageUrl]=url.absoluteString
//                    userData[User.id]=uid
//                    self.storeUserInformation(userData:userData)
//                    self.hideLoadingView()
//                    print("User has been created successfully")
//                }
//            }
//        }
//    }
//
//
//    func storeUserInformation(userData:[String:String]){
//
//        guard let uid = Auth.auth().currentUser?.uid else { return  }
//
//        Firestore.firestore().collection(users).document(uid).setData(userData) { error in
//            if let error = error {
//                print(error)
//                return
//
//            }
//            AuthViewModel.shared.fetchUser()
//            AuthViewModel.shared.isAouthenticatting.toggle()
//        }
//    }
//
//    func loadImage(){
//        guard let avatarUIImage=avatarUIImage else {return}
//        avatarImage = Image(uiImage: avatarUIImage)
//    }
//
//    private func showLoadingView(){isLoading = true}
//    private func hideLoadingView(){isLoading = false}
//
//}
