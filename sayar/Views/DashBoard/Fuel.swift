//
//  Fuel.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestore

struct Fuel : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
   let date : Date
    let km : Int
        // let d : Firebase.Timestamp
   // var d : Timestamp = Timestamp(date: Date())
    
    init(data:[String:Any]){
        
        self.id = data[Fuel.id] as! String
        self.carID = data[Fuel.carID] as? String ?? "N/A"
        self.cost = data[Fuel.cost] as? Double ?? 0.0
        self.km = data[Fuel.km] as? Int ?? 0
//        self.date = data[Fuel.date] as? Date ?? Date()
        if let date = data[Fuel.date] as? Date { self.date = date } else if let date = (data[Fuel.date] as? Timestamp)?.dateValue() { self.date = date } else { self.date  = Date() }
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    
    
}


