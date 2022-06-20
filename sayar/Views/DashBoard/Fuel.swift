//
//  Fuel.swift
//  sayar
//
//  Created by Razan Altamimi on 16/11/1443 AH.
//

import Foundation
import Firebase


struct Fuel : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
   let date : Double
    let km : Int
    
    
    init(data:[String:Any]){
        
        self.id = data[Fuel.id] as! String
        self.carID = data[Fuel.carID] as? String ?? "N/A"
        self.cost = data[Fuel.cost] as? Double ?? 0.0
        self.km = data[Fuel.km] as? Int ?? 0
        self.date = data[Fuel.date] as! Double
  
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
    static let date = "date"
    
    
}
