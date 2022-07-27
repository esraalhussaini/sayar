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
        self.fuel = []
    
        guard let carId = AuthViewModel.shared.car?.id else {return}
        
        self.db.collection("Fuel").whereField("carID", isEqualTo: carId).getDocuments { snapshot, error in
            
            
            if let docs = snapshot?.documents{
                var tmpFuel: [Fuel] = []
                
                docs.forEach { doc in
                    let docData = doc.data()
                    let fuel = Fuel(data: docData)
                    tmpFuel.append(fuel)
                }
                
                self.fuel = tmpFuel
                
            }
                    
                }
    }

    
        func uploadFuel(completion:@escaping ()->()){
    
            guard !costString.isEmpty else {
                self.appError = .emptyCost
                return
            }
            guard let carId = AuthViewModel.shared.car?.id else {
                completion()
                return}
            let docRef = db.collection("Car").document(carId).collection("CarFuel").document()
            docRef.setData(["id": docRef.documentID])
            let data : [String:Any] = [
                Fuel.cost : cost,
                Fuel.km : km,
                Fuel.date : date,
                Fuel.carID: carId,
                Fuel.id:docRef.documentID
            ]
            DispatchQueue.main.async {
                self.db.collection("Fuel").document(docRef.documentID).setData(data){ _ in
                self.fuel.append(Fuel(data: data))
                AuthViewModel.shared.updateKilometers(newKm:self.km)

//                self.fetchData()
                completion()
            }
        }
        }

    func deleteFuel(offsets: IndexSet) {

        
        guard let index = offsets.first else {return}
        let fuel = self.fuel[index]
        self.fuel.remove(atOffsets: offsets)
        let fuelId = fuel.id
        guard let carId = AuthViewModel.shared.car?.id else {return}
        let docRef = db.collection("Car").document(carId).collection("CarFuel").document(fuelId)
        let docId = docRef.documentID
        db.collection("Car").document(carId).collection("CarFuel").document(fuelId).delete()
        db.collection("Fuel").document(fuelId).delete()  { err in
        if let err = err {
          print("Error removing document: \(err)")
        }
        else {
          print("Document successfully removed!")
           // self.fetchData()
        }
      }
    
    
    }

    



    
}
