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

class VehiclesViewModel: ObservableObject {

    @Published var Vehicle =  [vehicle]()

private var db = Firestore.firestore()

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









    func subscribe() {
      if listenerRegistration == nil {
        listenerRegistration = db.collection("Vehicle").addSnapshotListener { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }

//          self.Vehicle = documents.compactMap { queryDocumentSnapshot in
//              try? queryDocumentSnapshot.data(as: Vehicle.self)
//          }
        }
      }
    }

      func removeBooks(atOffsets indexSet: IndexSet) {
        let Vehicle = indexSet.lazy.map { self.Vehicle[$0] }
          Vehicle.forEach { vehicles in
          if let documentId = vehicles.id {
            db.collection("Vehicle").document(documentId).delete { error in
              if let error = error {
                print("Unable to remove document: \(error.localizedDescription)")
              }
            }
          }
        }
      }


}

//---------------



//class VehiclesViewModel: ObservableObject{
//
//    @Published var vehicle = [Vehicle]()
////    @Published var cost : Double = 0.0
////    @Published var km : Double = 0.0
//
//    init(){
//        fetchData()
//    }
////
////    @Published var list = [Fuel]()
////
////    func getData(){
////
////        //get a refrence to the database
//        private var db = Firestore.firestore()
//
//    func fetchData(){
//
//        db.collection("Vehicle").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                      let vehicle = Vehicle(data: doc.data())
//                    print(vehicle.VehicleMake,"🤚🏻")
//                    self.vehicle.append(vehicle)
//                }
//
//            }
//
//
//
//        }}
//
//
//
////        func uploadFuel(completion:@escaping ()->()){
////    //        guard let user =  AuthViewModel.shared.user else {return}
//////            guard cost != 0.0 else {
//////                print("Please, type something")
//////                return}
////
////            let docRef = db.collection("Fuel").document()
////            let data : [String:Any] = [
////                Fuel.cost : cost,
////                Fuel.km : km,
////                Fuel.date : Date(),
////                Fuel.carID:"123",
////                Fuel.id:docRef.documentID
////            ]
////            docRef.setData(data){ _ in
////                print("Uploading Successfully")
////                completion()
////            }
////        }
////
////}
//
