//
//  Battery.swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Battery : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
    let km : Int
    let date : Date
    let expiredDate : Date
    let batteryCompany : String
    
    init(data:[String:Any]){
        
        self.id = data[Battery.id] as! String
        self.carID = data[Battery.carID] as? String ?? "N/A"
        self.cost = data[Battery.cost] as? Double ?? 0.0
        self.km = data[Battery.km] as? Int ?? 0
//        self.date = data[Battery.km] as? Date ?? Date()
//        self.expiredDate = data[Battery.expiredDate] as? Date ?? Date()
        self.batteryCompany = data[Battery.batteryCompany] as? String ?? "N/A"
        if let date = data[Battery.date] as? Date { self.date = date } else if let date = (data[Battery.date] as? Timestamp)?.dateValue() { self.date = date } else { self.date  = Date() }
        if let expiredDate = data[Battery.expiredDate] as? Date { self.expiredDate = expiredDate } else if let expiredDate = (data[Battery.expiredDate] as? Timestamp)?.dateValue() { self.expiredDate = expiredDate } else { self.expiredDate  = Date() }
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    static let batteryCompany = "batteryCompany"
    
}
