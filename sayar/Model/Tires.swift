//
//  Tiers .swift
//  sayar
//
//  Created by Razan Altamimi on 17/11/1443 AH.
//

import Foundation
import Firebase


struct Tires : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
 //   let date : Timetamp
    let km : Int
    let date : Date
    let expiredDate : Date
    
    
    init(data:[String:Any]){
        
        self.id = data[Tires.id] as! String
        self.carID = data[Tires.carID] as? String ?? "N/A"
        self.cost = data[Tires.cost] as? Double ?? 0.0
        self.km = data[Tires.km] as? Int ?? 0
        self.date = data[Tires.km] as? Date ?? Date()
        self.expiredDate = data[Tires.expiredDate] as? Date ?? Date()
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    static let expiredDate = "expiredDate"
    
    
}
