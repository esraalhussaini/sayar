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
    @Published var cost : Double = 0.0
    @Published var km : Double = 0.0
    
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
        
        db.collection("Car").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                    let car = Car(dictionary: doc.data())
//                    print(fuel.cost,"🤚🏻")
                    self.car.append(car)
                }
                
            }
            
            
            
        }
        
//
        
    }

  
//    ********************* NOUF fule ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
        func uploadFuel(completion:@escaping ()->()){
    //        guard let user =  AuthViewModel.shared.user else {return}
//            guard cost != 0.0 else {
//                print("Please, type something")
//                return}
    
            let docRef = db.collection("Fuel").document()
            let data : [String:Any] = [
                Fuel.cost : cost,
                Fuel.km : km,
                Fuel.date : Date(),
                Fuel.carID:"123",
                Fuel.id:docRef.documentID
            ]
            docRef.setData(data){ _ in
                print("Uploading Successfully")
                completion()
            }
        }
    
}

