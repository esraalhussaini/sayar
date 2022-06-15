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
 //   let date : Timetamp
    let km : Int
    
    
    init(data:[String:Any]){
        
        self.id = data[Fuel.id] as! String
        self.carID = data["carID"] as? String ?? "N/A"
        self.cost = data["cost"] as? Double ?? 0.0
        self.km = data["km"] as? Int ?? 0
  
    }
    
    static let id = "id"
    
    
    
}
