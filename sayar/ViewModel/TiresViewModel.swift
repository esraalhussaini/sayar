


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class TiresViewModel: ObservableObject{
    
    @Published var tires = [Tires]()
    @Published var cost : Double = 0.0
    @Published var km : Double = 0.0
    init(){
        fetchData()
    
    }

        private var db = Firestore.firestore()
    
    func fetchData(){
        
        db.collection("Tires").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let  tires = Tires(data: doc.data())
                    print(tires.cost,"🤚🏻")
                    self.tires.append(tires)
                }
                
            }
            
            
            
        }

    }


    //    ********************* NOUF tires ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadTires(completion:@escaping ()->()){
    //        guard let user =  AuthViewModel.shared.user else {return}
//          guard caption != "" else {
//              print("Please, type something")
//              return}
          let expDate = calculateExpiredDate()
          let docRef = db.collection("Tires").document()
          let data : [String:Any] = [
            Tires.cost : cost ,
            Tires.id:docRef.documentID,
            Tires.carID : "car 4",
            Tires.date:Timestamp(date: Date()),
            Tires.km: km,
            Tires.expiredDate:expDate
          ]
          docRef.setData(data){ _ in
              print("Uploading Successfully")
              completion()
          }
      }
    func calculateExpiredDate()->(Date){
        let today = Date()
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 365, to: today)!
        print(modifiedDate)
         return modifiedDate
    }

}
