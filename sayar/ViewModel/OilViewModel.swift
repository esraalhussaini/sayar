


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import SwiftUI


class OilViewModel: ObservableObject{
    
    @Published var oil = [Oil]()
    @Published var cost : Double = 0.0
    @Published var km : Double = 0.0
    @Published var appError: Errors? = nil
    @Published var costString : String = ""
    
     var d : Timestamp = Timestamp(date: Date())
    init(){
        fetchData()
    }

        private var db = Firestore.firestore()
    
    func fetchData(){
        
        db.collection("Oil").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let oil = Oil(data: doc.data())
                    print(oil.cost,"🤚🏻")
                    self.oil.append(oil)
                }
                
            }
            
            
            
        }

    }


    
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
          let docRef = db.collection("Oil").document()
          let data : [String:Any] = [
                Oil.cost : cost ,
                Oil.id:docRef.documentID,
                Oil.carID: "car1",
                Oil.date:Timestamp(date: Date()),
                Oil.km:km,
                Oil.expiredDate: expDate
          ]
          docRef.setData(data){ _ in
              print("Uploading Successfully")
              completion()
          }
      }
    func calculateExpiredDate()->Date{
        let today = Date()
        print(today)
         var value = 0
//        let modifiedDate = Calendar.current.date(byAdding: .day, value: 0, to: today)!
        if km == 0{
        value = 30
        } else if km == 1 {
            value = 100
        }
        let modifiedDate = Calendar.current.date(byAdding: .day, value: value, to: today)!
            print(modifiedDate)
             return modifiedDate
       
    }
    //
    //
}
