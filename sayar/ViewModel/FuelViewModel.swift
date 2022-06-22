//
//  Fuel.swift
//  sayar
//
//  Created by Razan Altamimi on 21/11/1443 AH.
//

import Foundation
import Firebase
//import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

//import FirebaseFirestore

class FuelViewModel: ObservableObject{
    
    @Published var fuel = [Fuel]()
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
        
        db.collection("Fuel").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let fuel = Fuel(data: doc.data())
                    print(fuel.cost,"🤚🏻")
                    self.fuel.append(fuel)
                }
                
            }
            
            
            
        }
        
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
        
    }
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

}
