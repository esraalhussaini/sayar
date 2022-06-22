//
//  User.swift
//  sayar
//
//  Created by anwar on 23/11/1443 AH.
//

import Foundation
struct User : Identifiable{

    let id : String
    let carID : String




    init(data:[String:Any]){

        self.id = data[User.id] as! String
        self.carID = data[User.carID] as? String ?? "N/A"
      

    }

    static let id = "id"
    static let carID = "carID"
    
}

