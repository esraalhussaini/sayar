//
//  Oil.swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase


struct Oil : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
    let date : Date
    let km : Int
    let expiredDate : Date
    
    
    init(data:[String:Any]){
        
        self.id = data[Oil.id] as! String
        self.carID = data[Oil.carID] as? String ?? "N/A"
        self.cost = data[Oil.cost] as? Double ?? 0.0
        self.km = data[Oil.km] as? Int ?? 0
        
        self.expiredDate = data[Oil.expiredDate] as? Date ?? Date()
        self.date = data[Oil.date] as? Date ?? Date()
        
        
    }
    
    static let id = "id"
    static let cost = "cost"
    static let carID = "carID"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    
  
    
    
}
