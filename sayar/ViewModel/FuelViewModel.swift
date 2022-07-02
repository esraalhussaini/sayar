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
//    @Published var cost : Double = 0.0
//    @Published var km : Double = 0.0
    @Published  var  date  = Date()

    @Published var appError: Errors? = nil
    @Published var costString : String = ""
    @Published var kmString : String = ""

    var cost : Double{
        Double(costString) ?? 0.0
    }
    
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
        guard let carId = AuthViewModel.shared.car?.id else {return}
                db.collection("Car").document(carId).collection("CarFuel").getDocuments { snapshot, error in
                    
                    if let docs = snapshot?.documents{
                        docs.forEach { doc in
                            let docId = doc.documentID
                            self.db.collection("Fuel").document(docId).getDocument { snapshot, error in
                                guard let docData = snapshot?.data() else {return}
                                let fuel = Fuel(data: docData)
                              print(fuel.cost,"🤚🏻")
                              self.fuel.append(fuel)
                                
                            }
                              
                        }
                        
                    }
                    
                    
                    
                }
    }
//        db.collection("Fuel").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//            
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                      let fuel = Fuel(data: doc.data())
//                    print(fuel.cost,"🤚🏻")
//                    self.fuel.append(fuel)
//                }
//                
//            }
//            
//            
//            
//        }
        
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
    
        func uploadFuel(completion:@escaping ()->()){
    //        guard let user =  AuthViewModel.shared.user else {return}
//            guard cost != 0.0 else {
//                print("Please, type something")
//                return}
    
            guard !costString.isEmpty else {
                self.appError = .emptyCost
                return
            }
            guard let carId = AuthViewModel.shared.car?.id else {return}
            let docRef = db.collection("Car").document(carId).collection("CarFuel").document()
            docRef.setData(["id": docRef.documentID])
            let data : [String:Any] = [
                Fuel.cost : cost,
                Fuel.km : km,
                Fuel.date : date,
                Fuel.carID: carId,
                Fuel.id:docRef.documentID
            ]
            db.collection("Fuel").document(docRef.documentID).setData(data){ _ in
                print("Uploading Successfully")
                completion()
                AuthViewModel.shared.updateKilometers(newKm:self.km)

                self.fetchData()
            }
        }
    
    func deleteFuel(Fuel: Fuel) {
        guard let carId = AuthViewModel.shared.car?.id else {return}
        db.collection("Car").document(carId).collection("CarFuel").document().delete() { err in
        if let err = err {
          print("Error removing document: \(err)")
        }
        else {
          print("Document successfully removed!")
        }
      }
    }
    
}
