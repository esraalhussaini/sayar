//
//  addCarViewModel.swift
//  sayar
//
//  Created by anwar on 24/11/1443 AH.
//

import Foundation
import Firebase
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
        
       // guard let uid = Auth.auth().currentUser?.uid else {return}
        let docRef = Firestore.firestore().collection("Car").document("anI3jdMSPjVUT4a4e2KWxJ7whJw1")
        
            let data : [String:Any] = [
               
                Car.id : docRef.documentID,
                Car.carMake : carMake,
                Car.carModel :carModel,
                Car.carManufactureYear: carManufactureYear,
                Car.carKm : km,
                Car.carImageUrl :"image",
//                check the image from Anwar 
            ]
            docRef.setData(data){ _ in
                print("Uploading Successfully")
                completion()
            }
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

