//
//  vehicle.swift
//  sayar
//
//  Created by anwar on 28/11/1443 AH.
//

import Foundation


import Firebase
import SwiftUI
import FirebaseFirestoreSwift

//struct vehicle : Identifiable ,Codable {
//  @DocumentID var id: String?
////let id : Int
//   // let VehicleID : String
//    let  VehicleMake: String
//    let  VehicleModel: String
//    let  VManufactureYear: Int
//    let VehicleKM: Int
//   // let  VehicleImageUrl: UIImage
//
//
//  enum CodingKeys: String{
//         case id
//       //  case VehicleID
//         case VehicleMake
//         case VehicleModel
//         case VManufactureYear = "VManufactureYear"
//
//         case VehicleKM = "VehicleKM"
//        // case VehicleImageUrl
//       }
//
//
    
    
//}




    
    //-------------------------------------------------------------------



struct Vehicle  : Identifiable{
    let id : String

    let  VehicleMake: String
    let  VehicleModel: String
    let  VManufactureYear: Int
    let VehicleKM: Int
    //let  VehicleImageUrl: String


        // let d : Firebase.Timestamp
   // var d : Timestamp = Timestamp(date: Date())

    
    
    
 

    
    init(data:[String:Any]){

        self.id = data[Vehicle.id] as! String
        //self.carID = data[Vehicle.carID] as? String ?? "N/A"
        self.VehicleMake = data[Vehicle.VehicleMake] as? String ?? "N/A"
        self.VehicleModel = data[Vehicle.VehicleModel] as? String ?? "N/A"

        self.VManufactureYear = data[Vehicle.VManufactureYear] as? Int ?? 0
        self.VehicleKM  = Int(data[Vehicle.VehicleKM ] as? Double ?? 0.0)
       // self.VehicleImageUrl = data[Vehicle.VehicleImageUrl] as? String ?? "N/A"

    }


    static let id = "id"
    static let VehicleMake = "VehicleMake"
    static let VehicleModel = "VehicleModel"
    static let VManufactureYear = "VManufactureYear"
    static let VehicleKM = "VehicleKM"
   // static let VehicleImageUrl = "VehicleImageUrl"


}


