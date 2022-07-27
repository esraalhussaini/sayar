//
//  addCarViewModel.swift
//  sayar
//
//  Created by anwar on 24/11/1443 AH.
//
import UIKit
import SwiftUI
import Foundation
import Firebase
import FirebaseStorage

//import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

//import FirebaseFirestore

class AddCarViewModel: ObservableObject{
    

 
    
    
//Image?
    @Published var showImagePicker = false
    @Published var showCamera = false
    @Published var imageUser: UIImage?
    @Published var carDefaultImage = Image("Cardefault")

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
    
//    var carModel : Double{
//        Double(carModelString) ?? 0.0
//    }
    init(){
        //fetchData()
    }
   
//
//    @Published var list = [Fuel]()
//
//    func getData(){
//
//        //get a refrence to the database
        private var db = Firestore.firestore()
    
//    func fetchData(){
//        guard let uid = Auth.auth().currentUser?.uid else {return}
////        let docRef = Firestore.firestore().collection("Car").document(uid)
////        db.collection("Car").document(uid).getDocuments
//        db.collection("Car").document(uid).getDocument { snapshot, error in
//            
//            guard let data = snapshot?.data() else {return}
//            let car = Car(dictionary: data)
//        }
//   
//    }//fetchdata

    
    func uploadCar(completion:@escaping ()->()){
        
      
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let docRef = Firestore.firestore().collection("Car").document()
        //not let
       // Car.CarImage :"HHHHH",
            var data : [String:Any] = [
               
                Car.id : docRef.documentID,
                Car.carMake : carMake,
                Car.carModel : carModelString,
                Car.carManufactureYear: carManufactureYear,
                Car.carKm : km,
                Car.userId: uid
            ]
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
               // self.storeUserInformation(data:data)
               // self.hideLoadingView()
                docRef.setData(data){ _ in
                    print("added in \(docRef.documentID)")
                    print(LocalizedStringKey("UploadingSuccessfully"))
                    completion()
                    AuthViewModel.shared.updateKilometers(newKm:self.km)
                    
               
                }
            print(LocalizedStringKey("Userhasbeencreatedsuccessfully"))
                completion()
            }
        }

       print("✅✅✅✅✅✅✅✅")
        
        }//uploudCar
 

    
    func loadImage(){
        guard let imageUser=imageUser else {return}
        carDefaultImage = Image(uiImage: imageUser)
    }
    
   
    func generateYearUntilNow ()->[Int]{
         var formattedDate: String? = ""

         let format = DateFormatter()
         format.dateFormat = "yyyy"
         formattedDate = format.string(from: Date())

 //        var yearsTillNow: [String] {
             var years = [Int]()
             for i in (Int(formattedDate!)!-70..<Int(formattedDate!)!+1).reversed() {
                 years.append(i)
             }
             return years
 //        }
     }
}//class


