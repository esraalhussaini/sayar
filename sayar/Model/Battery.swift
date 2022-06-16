//
//  Battery.swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase


struct Battery : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
 //   let date : Timetamp
    let km : Int
    let date : String
    let expiredDate : String
    
    
    init(data:[String:Any]){
        
        self.id = data[Battery.id] as! String
        self.carID = data[Battery.carID] as? String ?? "N/A"
        self.cost = data[Battery.cost] as? Double ?? 0.0
        self.km = data[Battery.km] as? Int ?? 0
        self.date = data[Battery.km] as! String
        self.expiredDate = data[Battery.expiredDate] as! String
        
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    
    
}
