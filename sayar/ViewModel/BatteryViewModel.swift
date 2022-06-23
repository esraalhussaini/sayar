


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class BatteryViewModel: ObservableObject{
    
    @Published var battery = [Battery]()
    @Published var cost : Double = 0.0
    @Published var km : Double = 0.0
    init(){
        fetchData()
    }

        private var db = Firestore.firestore()
    
    func fetchData(){
        
        db.collection("Battery").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let battery = Battery(data: doc.data())
                    print(battery.cost,"🤚🏻")
                    self.battery.append(battery)
                }
                
            }
            
            
            
        }

    }


    //    ********************* NOUF battery ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadBattery(completion:@escaping ()->()){
    //        guard let user =  AuthViewModel.shared.user else {return}
//          guard caption != "" else {
//              print("Please, type something")
//              return}
          let expDate = calculateExpiredDate()
          let docRef = db.collection("Battery").document()
          let data : [String:Any] = [
                Battery.cost : cost ,
                Battery.id:docRef.documentID,
                Battery.carID : "car3",
                Battery.date:Timestamp(date: Date()),
                Battery.km: km,
                Battery.expiredDate:expDate
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
