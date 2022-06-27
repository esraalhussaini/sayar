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
    let phoneNumber : String



    init(data:[String:Any]){

        self.id = data[User.id] as! String
        self.carID = data[User.carID] as? String ?? "N/A"
        self.phoneNumber  = data[User.phoneNumber ] as? String ?? "N/A"

    }

    static let id = "id"
    static let carID = "carID"
    static let phoneNumber = "phoneNumber"
}

