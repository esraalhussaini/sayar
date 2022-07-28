
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
    @Published var batteryComp : String = ""

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
        self.battery = []
        guard let carId = AuthViewModel.shared.car?.id else {return}
        self.db.collection("Battery").whereField("carID", isEqualTo: carId).getDocuments { snapshot, error in
            
            
            if let docs = snapshot?.documents{
                var tmpBattery: [Battery] = []
                
                docs.forEach { doc in
                    let docData = doc.data()
                    let battery = Battery(data: docData)
                   
                    tmpBattery.append(battery)
                }
                
                self.battery = tmpBattery
                
            }}}
    
               
    func uploadBattery(completion:@escaping ()->()){
  
        guard !costString.isEmpty else {
            self.appError = .emptyCost
            return
        }
          let expDate = calculateExpiredDate(date: date)
        guard let carId = AuthViewModel.shared.car?.id else {
            completion()
            return}
        let docRef = db.collection("Car").document(carId).collection("CarBattery").document()
        docRef.setData(["id": docRef.documentID])
          let data : [String:Any] = [
                Battery.cost : cost ,
                Battery.id:docRef.documentID,
                Battery.carID : carId,
                Battery.date:date ,
                Battery.km: km,
                Battery.expiredDate:expDate,
                Battery.batteryCompany: batteryComp
          ]
        DispatchQueue.main.async {
            self.db.collection("Battery").document(docRef.documentID).setData(data){ _ in
            self.battery.append(Battery(data: data))
           
            AuthViewModel.shared.updateKilometers(newKm:self.km)

//            self.fetchData()
            completion()
        }
        }
      }
    func calculateExpiredDate(date : Date)->(Date){
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 365, to: date)!
        //        for the battery, it is year approximately to the next chanage
        print(modifiedDate)
         return modifiedDate
    }
    func formatedExpiredDate(battery : Battery?)->String?{
        guard let battery = battery else {
            return nil
        }
//        let expDate = calculateExpiredDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        let formattedDate = formatter.string(from: battery.expiredDate)
        return formattedDate
    }
    func clearState(){
        costString = ""
        kmString = ""
        batteryComp = ""
        
    }
    func deleteBattery(offsets: IndexSet) {
        guard let index = offsets.first else {return}
        let battery = self.battery[index]
        self.battery.remove(atOffsets: offsets)
        let batteryId = battery.id
        guard let carId = AuthViewModel.shared.car?.id else {return}
        let docRef = db.collection("Car").document(carId).collection("CarBattery").document(batteryId)
        let docId = docRef.documentID
        db.collection("Car").document(carId).collection("CarBattery").document(batteryId).delete()
        db.collection("Battery").document(batteryId).delete()  { err in
        if let err = err {
          print("Error removing document: \(err)")
        }
        else {
          print("Document successfully removed!")
           // self.fetchData()
        }
      }
    
    
    }
    
    
}
