//
//  addCarViewModel.swift
//  sayar
//
//  Created by anwar on 24/11/1443 AH.
//
import UIKit
import Foundation
import Firebase
import FirebaseStorage

//import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

//import FirebaseFirestore

class addCarViewModel: ObservableObject{
    

 
    
    
//Image?
    @Published var imageUser: UIImage?
    let users = "Car"
//    static let shared = addCarViewModel()
   //@Published var defaultImageCar = Image("Cardefault")
      @Published  var  date  = Date()
    //--------------------
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
     
    }//fetchdata

  
//    ********************* NOUF fule ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadCar(completion:@escaping ()->()){
        
      
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let docRef = Firestore.firestore().collection("Car").document(uid)
        //not let
            var data : [String:Any] = [
               
                Car.id : docRef.documentID,
                Car.carMake : carMake,
                Car.carModel : carModel,
                Car.carManufactureYear: carManufactureYear,
                Car.carKm : km,
                Car.CarImage :"HHHHH",
                
             
//                check the image from Anwar
            ]
        persistImageToStorage()
       print("✅✅✅✅✅✅✅✅")
       
        
            docRef.setData(data){ _ in
                print("added in \(docRef.documentID)")
                print("Uploading Successfully")
                completion()
                AuthViewModel.shared.updateKilometers(newKm:self.km)
                
           
            }
        
      

  
    
        
        //anwar Image
          
          func persistImageToStorage() {

              guard let uid = Auth.auth().currentUser?.uid else { return }

              let ref = Storage.storage().reference(withPath: uid)

              guard let imageData = imageUser?.jpegData(compressionQuality: 0.5) else { return }

              ref.putData(imageData, metadata: nil) { metadata, err in
                  if let err = err {
                      print("Failed to push image to Storage: \(err)")
                     // self.hideLoadingView()
                      return
                  }

                  ref.downloadURL { url, err in
                      if let err = err {
                          print("Failed to retrieve downloadURL: \(err)")
                          return
                      }
                      print("Successfully stored image with url: \(url?.absoluteString ?? "")")

                      guard let url=url else{return}
                    
                      data[Car.CarImage]=url.absoluteString
                      data[Car.id]=uid
                     // self.storeUserInformation(data:data)
                     // self.hideLoadingView()
                      print("User has been created successfully")
                  }
              }
          }
     
        
        }//uploudCar
 

    
    
    func storeUserInformation(data:[String:Any]){

        guard let uid = Auth.auth().currentUser?.uid else { return  }
//car
        Firestore.firestore().collection(users).document(uid).setData(data) { error in
            if let error = error {
                print(error)
                return

            }
         // AuthViewModel.shared.fetchCar(completion)
         AuthViewModel.shared.isAouthenticatting.toggle()
        }
    }
    
//    func loadImage(){
//        guard let imageUser=imageUser else {return}
//        defaultImageCar = Image(uiImage: imageUser)
//    }
//
}//class

