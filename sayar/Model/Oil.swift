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
 //   let date : Timetamp
    let km : Int
    let date : String
    let expiredDate : String
    
    
    init(data:[String:Any]){
        
        self.id = data[Oil.id] as! String
        self.carID = data[Oil.carID] as? String ?? "N/A"
        self.cost = data[Oil.cost] as? Double ?? 0.0
        self.km = data[Oil.km] as? Int ?? 0
        self.date = data[Oil.km] as! String
        self.expiredDate = data[Oil.expiredDate] as! String
        
        
    }
    
    static let id = "id"
    static let cost = "cost"
    static let carID = "carID"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
  
    
    
}
