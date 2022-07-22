//
//  Oil.swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore


struct Oil : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
    let date : Date
    let km : Int
    let expiredDate : Date
    let oilType : String
    let oilCompany : String
    
    
    init(data:[String:Any]){
        if let date = data[Oil.date] as? Date { self.date = date } else if let date = (data[Oil.date] as? Timestamp)?.dateValue() { self.date = date } else { self.date  = Date() }
        if let expiredDate = data[Oil.expiredDate] as? Date { self.expiredDate = expiredDate } else if let expiredDate = (data[Oil.expiredDate] as? Timestamp)?.dateValue() { self.expiredDate = expiredDate } else { self.expiredDate  = Date() }
        self.id = data[Oil.id] as! String
        self.carID = data[Oil.carID] as? String ?? "N/A"
        self.cost = data[Oil.cost] as? Double ?? 0.0
        self.km = data[Oil.km] as? Int ?? 0
//        self.expiredDate = (data[Oil.expiredDate] as? Timestamp)?.dateValue() ?? Date()
//        self.date = (data[Oil.date] as? Timestamp)?.dateValue() ?? Date()
        self.oilType = data[Oil.oilType] as? String ?? ""
        self.oilCompany = data[Oil.oilCompany] as? String ?? ""
        
    }
    
    static let id = "id"
    static let cost = "cost"
    static let carID = "carID"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    static let oilType = "oilType"
    static let oilCompany = "oilCompany"
  
    
    
}
