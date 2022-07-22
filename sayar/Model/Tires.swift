//
//  Tiers .swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Tires : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
    let km : Int
    let date : Date
    let expiredDate : Date
    let manufactureYear : Date
    let tireCompany : String
    
    
    init(data:[String:Any]){
        
        self.id = data[Tires.id] as! String
        self.carID = data[Tires.carID] as? String ?? "N/A"
        self.cost = data[Tires.cost] as? Double ?? 0.0
        self.km = data[Tires.km] as? Int ?? 0
//        self.date = data[Tires.km] as? Date ?? Date()
//        self.expiredDate = data[Tires.expiredDate] as? Date ?? Date()
//        self.manufactureYear = data[Tires.manufactureYear] as? Date ?? Date()
        self.tireCompany = data[Tires.tireCompany] as? String ?? "N/A"
        if let date = data[Tires.date] as? Date { self.date = date } else if let date = (data[Tires.date] as? Timestamp)?.dateValue() { self.date = date } else { self.date  = Date() }
        if let expiredDate = data[Tires.expiredDate] as? Date { self.expiredDate = expiredDate } else if let expiredDate = (data[Tires.expiredDate] as? Timestamp)?.dateValue() { self.expiredDate = expiredDate } else { self.expiredDate  = Date() }
        if let manufactureYear = data[Tires.manufactureYear] as? Date { self.manufactureYear = manufactureYear } else if let manufactureYear = (data[Tires.manufactureYear] as? Timestamp)?.dateValue() { self.manufactureYear = manufactureYear } else { self.manufactureYear  = Date() }
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    static let manufactureYear = "manufactureYear"
    static let tireCompany = "tireCompany"
}
