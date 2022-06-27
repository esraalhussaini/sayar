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
    
    private var listenerRegistration: ListenerRegistration?
      
    deinit {
      unsubscribe()
    }
     
    func unsubscribe() {
      if listenerRegistration != nil {
        listenerRegistration?.remove()
        listenerRegistration = nil
      }
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
    
    
    
    
    
    
//    
//   func removeCars(atOffsets indexSet: IndexSet) {
//     let Vehicle = indexSet.lazy.map { self.vehicle[$0] }
////       Vehicle.forEach { v in
////       if let documentId = v.id {
////         db.collection("Vehicle").document(documentId).delete { error in
////           if let error = error {
////             print("Unable to remove document: \(error.localizedDescription)")
////           }
////         }
////       }
//     }
//   }
    
    
    
    
    
    
}//class

