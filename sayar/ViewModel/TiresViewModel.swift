


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class TiresViewModel: ObservableObject{
    
    @Published var tires = [Tires]()
//    @Published var cost : Double = 0.0
//    @Published var km : Double = 0.0
    @Published  var  date  = Date()
    @Published var appError: Errors? = nil
    @Published var costString : String = ""
    @Published var kmString : String = ""
    @Published var tireReleaseString : String = ""

    var tireRelease : Int{
        Int(tireReleaseString) ?? 0
    }
    
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
                db.collection("Car").document(carId).collection("CarTires").getDocuments { snapshot, error in
        
            
            if let docs = snapshot?.documents{
                docs.forEach { doc in
                    let docId = doc.documentID
                    self.db.collection("Tires").document(docId).getDocument { snapshot, error in
                        guard let docData = snapshot?.data() else {return}
                      let  tires = Tires(data: docData)
//                    print(tires.cost,"🤚🏻")
                    self.tires.append(tires)
                }
                
            }
            
            }
            
        }

    }
//    func fetchData(){
//
//        db.collection("Tires").getDocuments {snapdhot, error in
//            guard error == nil else {
//                print("Error \(error)")
//                return
//            }
//
//            if let docs = snapdhot?.documents{
//                docs.forEach { doc in
//                      let  tires = Tires(data: doc.data())
//                    print(tires.cost,"🤚🏻")
//                    self.tires.append(tires)
//                }
//
//            }
//
//
//
//        }
//
//    }


    //    ********************* NOUF tires ***********************
    //    var fueldata : [String:String] = [:]
    //    fueldata[Fuel.carID] = self.
    
    func uploadTires(completion:@escaping ()->()){
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
        let docRef = db.collection("Car").document(carId).collection("CarTires").document()
        docRef.setData(["id": docRef.documentID])
//          let docRef = db.collection("Tires").document()
          let data : [String:Any] = [
            Tires.cost : cost ,
            Tires.id:docRef.documentID,
            Tires.carID : carId,
            Tires.date:date,
            Tires.km: km,
            Tires.expiredDate:expDate
          ]
        db.collection("Tires").document(docRef.documentID).setData(data){ _ in
            print("Uploading Successfully")
            completion()
            AuthViewModel.shared.updateKilometers(newKm:self.km)

            self.fetchData()
          }
      }
    func calculateExpiredDate()->(Date){
        let today = date
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 548, to: today)!
//        for the tires, it is year and a half approximately to the next chanage
        print(modifiedDate)
         return modifiedDate
    }
    
    func formatedDate()->String{
//        let s = "N/A"
//        guard let carId = AuthViewModel.shared.car?.id else {return }
        
//        here I have to check if there is a real changing date otherwise it should return "N/A"
        let expDate = calculateExpiredDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        let formattedDate = formatter.string(from: expDate)
        return formattedDate
    }

}

