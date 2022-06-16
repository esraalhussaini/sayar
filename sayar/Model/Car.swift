//
//  Car.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import Foundation

import Firebase


struct Car : Identifiable{
    
    let id : String
    let carID : String
    let cost : Double
 //   let date : Timetamp
    let km : Int
 
    
    
    
    init(data:[String:Any]){
        
        self.id = data[Car.id] as! String
        self.carID = data[Car.carID] as? String ?? "N/A"
        self.cost = data[Car.cost] as? Double ?? 0.0
        self.km = data[Car.km] as? Int ?? 0
  
    }
    
    static let id = "id"
    static let carID = "carID"
    static let cost = "cost"
    static let km = "km"
}
