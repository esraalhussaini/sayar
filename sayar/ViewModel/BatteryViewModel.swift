


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class BatteryViewModel: ObservableObject{
    
    @Published var battery = [Battery]()
//    @Published var cost : Double = 0.0
//    @Published var km : Double = 0.0
    @Published  var  date  = Date()
    @Published var appError: Errors? = nil
    @Published var costString : String = ""
    @Published var kmString : String = ""

    var cost : Double{
        Double(costString) ?? 0.0
    }
    
    var km : Double{
        Double(kmString) ?? 0.0
    }
    init(){
        fetchData()
    }

        private var db = Firestore.firestore()
    
    func fetchData(){
        guard let carId = AuthViewModel.shared.car?.id else {return}
                db.collection("Car").document(carId).collection("CarBattery").getDocuments { snapshot, error in
        
            
            if let docs = snapshot?.documents{
                docs.forEach { doc in
                    let docId = doc.documentID
                    self.db.collection("Battery").document(docId).getDocument { snapshot, error in
                        guard let docData = snapshot?.data() else {return}
                        let battery = Battery(data: docData)
                        self.battery.append(battery)
                        
                    }
//                      let battery = Battery(data: doc.data())
//                    print(battery.cost,"🤚🏻")
//                    self.battery.append(battery)
                }
                
            }
            
        }

    }
//    func fetchData(){
//
//        db.collection("Battery").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                      let battery = Battery(data: doc.data())
//                    print(battery.cost,"🤚🏻")
//                    self.battery.append(battery)
//                }
//
//            }
//
//
//
//        }
//
//    }


    //    ********************* NOUF battery ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadBattery(completion:@escaping ()->()){
  
    //        guard let user =  AuthViewModel.shared.user else {return}
//          guard caption != "" else {
//              print("Please, type something")
//              return}
        guard !costString.isEmpty else {
            self.appError = .emptyCost
            return
        }
          let expDate = calculateExpiredDate()
        guard let carId = AuthViewModel.shared.car?.id else {
            print("Here 📍")
            return}
        let docRef = db.collection("Car").document(carId).collection("CarBattery").document()
        docRef.setData(["id": docRef.documentID])
//          let docRef = db.collection("Battery").document()
          let data : [String:Any] = [
                Battery.cost : cost ,
                Battery.id:docRef.documentID,
                Battery.carID : carId,
                Battery.date:date ,
                Battery.km: km,
                Battery.expiredDate:expDate
          ]
        db.collection("Battery").document(docRef.documentID).setData(data){ _ in
            print("Uploading Successfully")
            completion()
            AuthViewModel.shared.updateKilometers(newKm:self.km)

            self.fetchData()
            
            
        }
//          docRef.setData(data){ _ in
//              print("Uploading Successfully")
//              completion()
//          }
      }
    func calculateExpiredDate()->(Date){
        let today = date
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 365, to: today)!
        //        for the battery, it is year approximately to the next chanage
        print(modifiedDate)
         return modifiedDate
    }
    
}
