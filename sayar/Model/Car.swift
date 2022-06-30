//
//  Car.swift
//  sayar
//
//  Created by anwar on 17/11/1443 AH.
//

import Foundation

import Firebase
import FirebaseAuth
import FirebaseStorage
//سويت كومنت لاني احتاج اجرب مودل الكار، انوار

struct Car {

    let id : String
//    let carID : String
    let carMake : String
    let carModel : String
    let carManufactureYear : Int
    let carKm : Int
    let carImageUrl : String



    init(dictionary:[String:Any]){
        
       // self.id = dictionary[Car.id] as! String Nouf
        //    self.id = dictionary[Car.id] as? String ?? "N/A"Anwar AfterEdite
        //  self.carID = dictionary[Car.carID] as! String
        
        self.id = dictionary[Car.id] as? String ?? ""
        //self.id = dictionary[Car.id] as? String ?? "N/A"
//        self.carID = dictionary[Car.carID]  as? String ?? ""
        self.carMake = dictionary[Car.carMake] as! String
        self.carModel = dictionary[Car.carModel] as! String
        self.carManufactureYear = dictionary[Car.carManufactureYear] as? Int ?? 0
        self.carKm = dictionary[Car.carKm] as? Int ?? 0
     self.carImageUrl = dictionary[Car.carImageUrl]  as? String ?? "N/A"
    }
       // self.carImageUrl = dictionary[Car.carImageUrl]  as? String ?? "N/A"

    

    static let id = "CarID"
   // static let carID = "carID"
    static let carMake = "CarMake"
    static let carModel = "CarModel"
    static let carManufactureYear = "CarManufactureYear"
    static let carKm = "CarKM"
    static let carImageUrl = "CarImage"
    
    
}

