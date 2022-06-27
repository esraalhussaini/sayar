//
//  VehiclesViewModel.swift
//  sayar
//
//  Created by anwar on 28/11/1443 AH.
//

import Foundation

import Firebase
import FirebaseCore
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift
import Combine

 
//Vehicles //firstore
//vehicles  // class
//vehicless // varibels
//
//class VehiclesViewModel: ObservableObject {
//
//
//
//private var db = Firestore.firestore()
//
//    @Published var vehicle =  [Vehicle]()
//
//    private var listenerRegistration: ListenerRegistration?
//
//      deinit {
//        unsubscribe()
//      }
//
//      func unsubscribe() {
//        if listenerRegistration != nil {
//          listenerRegistration?.remove()
//          listenerRegistration = nil
//        }
//      }
//
//
//}//CLASS
    


class VehiclesViewModel: ObservableObject{
    
//
//    let  VehicleMake: String
//    let  VehicleModel: String
//    let  VManufactureYear: Int
//    let VehicleKM: Int
//    let  VehicleImageUrl: String
//
    
    @Published var vehicle = [Vehicle]()
  @Published var VehicleMake : String = ""
    @Published var VehicleModel : String = ""
    @Published var VManufactureYear: Double = 0.0
    @Published var VehicleKM: Double = 0.0
    @Published var VehicleImageUrl: String = ""
    @Published var costString : String = ""
    
    
    
    @Published var appError: Errors? = nil
    
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
        
        db.collection("Vehicle").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let vehicle = Vehicle(data: doc.data())
                    print(vehicle.VehicleKM,"🤚🏻")
                    self.vehicle.append(vehicle)
                }
                
            }
            
            
            
        }
    }//FUN
        
//        db.collection("Fuel").addSnapshotListener { querySnapshot, error in
//
//            guard let documents = querySnapshot?.documents else {
//
//
//                print("no documents")
//                return
//            }
//
//            self.fuel = documents.map(){ (queryDocumentSnapshot) -> Fuel in
//                let data = queryDocumentSnapshot.data()
//
//              //  let id = data["id"] as! String
//                let carID = data["carID"] as? String ?? "N/A"
//                let cost = data["cost"] as? Double ?? 0.0
//                let km = data["km"] as? Int ?? 0
//                let date = data["date"] as! Double
//
//
//                //let fuel = Fuel(carID: carID,cost: cost, date: date , id: id , km: km )
//                return Fuel(id: .init(), carID: carID,cost: cost, km: km, date: date )
//
//
//
//            }
//        }
        
   
//
//        // read the documents at a specific path
//        db.collection("Fuel").getDocuments { snapshot , error in
//             //check for error
//            if error == nil{
//                //no errors
//            }
//
//            if let snapshot = snapshot {
//
//                //get all the document and create instance of fuel
//                snapshot.documents.map { d in
//                  return Fuel(data: <#T##[String : Any]#>)                }
//
//
//
//            }else{}
//        }
//
//
//    }

//    ********************* NOUF fule ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
//        func uploadVehicle(completion:@escaping ()->()){
//
//            
//            guard let uid = Auth.auth().currentUser?.uid else {return}
//            let docRef = Firestore.firestore().collection("Vehicle").document(uid)
//           
//            let data : [String:Any] = [
//                Vehicle.VehicleMake : VehicleMake,
//                Vehicle.VehicleModel : VehicleModel,
//                Vehicle.VManufactureYear : VManufactureYear,
//                Vehicle.VehicleKM : VehicleKM,
//                Vehicle.VehicleImageUrl: VehicleImageUrl,
//                Vehicle.id:docRef.documentID
//            ]
//             docRef.setData(data){ _ in
//                print("Uploading Successfully")
//                completion()
//            }
//        }
    
}
