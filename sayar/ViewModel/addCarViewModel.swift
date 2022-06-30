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
    
    @Published var car = [Car]()
//    @Published var cost : Double = 0.0
//    @Published var km : Double = 0.0
    @Published var kmString : String = ""
    var km : Double{
        Double(kmString) ?? 0.0
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
                Car.carMake : "",
                Car.carModel :"",
                Car.carManufactureYear: 2009,
                Car.carKm : 9.8,
                Car.carImageUrl :"image",
            ]
            docRef.setData(data){ _ in
                print("Uploading Successfully")
                completion()
            }
        }
    
}

