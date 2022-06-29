


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import SwiftUI


class OilViewModel: ObservableObject{
    
    @Published var oil = [Oil]()
//    @Published var cost : Double = 0.0
//    @Published var km : Double = 0.0
    @Published var appError: Errors? = nil
    @Published var costString : String = ""
    @Published var kmString : String = ""
    @Published  var  date  = Date()
    
    var cost : Double{
        Double(costString) ?? 0.0
    }
    
    var km : Double{
        Double(kmString) ?? 0.0
    }
//     var d : Timestamp = Timestamp(date: Date())
    init(){
        fetchData()
    }

        private var db = Firestore.firestore()
    func fetchData(){
        guard let carId = AuthViewModel.shared.car?.id else {return}
                db.collection("Oil").document(carId).collection("CarOil").getDocuments { snapshot, error in
                    
        
            
            if let docs = snapshot?.documents{
                docs.forEach { doc in
                      let oil = Oil(data: doc.data())
                    print(oil.cost,"🤚🏻")
                    self.oil.append(oil)
                }
                
            }
            
            
            
        }

    }
//    func fetchData(){
//
//        db.collection("Oil").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                      let oil = Oil(data: doc.data())
//                    print(oil.cost,"🤚🏻")
//                    self.oil.append(oil)
//                }
//
//            }
//
//
//
//        }
//
//    }


    
    //    ********************* NOUF oil ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadOil(completion:@escaping ()->()){
    //        guard let user =  AuthViewModel.shared.user else {return}
//          guard caption != "" else {
//              print("Please, type something")
//              return}
        guard !costString.isEmpty else {
            self.appError = .emptyCost
            return
        }
          let expDate = calculateExpiredDate()
        guard let carId = AuthViewModel.shared.car?.id else {return}
        let docRef = db.collection("Car").document(carId).collection("CarOil").document()
//          let docRef = db.collection("Oil").document()
          let data : [String:Any] = [
                Oil.cost : cost ,
                Oil.id:docRef.documentID,
                Oil.carID: carId,
                Oil.date: date,
                Oil.km: km,
                Oil.expiredDate: expDate
          ]
          docRef.setData(data){ _ in
              print("Uploading Successfully")
              completion()
          }
      }
    func calculateExpiredDate()->Date{
        let today = date
        print(today)
         var value = 0
//        let modifiedDate = Calendar.current.date(byAdding: .day, value: 0, to: today)!
        if km == 3 || km == 5 || km == 8 {
        value = 183
// for the oil of 3,5,8 months, it is six months approximately to the next chanage
        }
        else if km == 10 || km == 15 {
            value = 240
// for the oil of 10,15 months, it is eight months approximately to the next chanage
        }
        let modifiedDate = Calendar.current.date(byAdding: .day, value: value, to: today)!
            print(modifiedDate)
             return modifiedDate
       
    }
    //
    //
}
