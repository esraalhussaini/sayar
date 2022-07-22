


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
    @Published  var  manufactureYEAR  = Date()
    @Published var tireComp : String = ""

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
        self.tires = []
        guard let carId = AuthViewModel.shared.car?.id else {return}
                db.collection("Car").document(carId).collection("CarTires").getDocuments { snapshot, error in
        
                    DispatchQueue.main.async {
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

    }
//
    
    
    func uploadTires(completion:@escaping ()->()){
  
        guard !costString.isEmpty else {
            self.appError = .emptyCost
            return
        }
          let expDate = calculateExpiredDate(date: date)
        guard let carId = AuthViewModel.shared.car?.id else {
            completion()
            return}
        let docRef = db.collection("Car").document(carId).collection("CarTires").document()
        docRef.setData(["id": docRef.documentID])
          let data : [String:Any] = [
            Tires.cost : cost ,
            Tires.id:docRef.documentID,
            Tires.carID : carId,
            Tires.date:date,
            Tires.km: km,
            Tires.expiredDate:expDate,
            Tires.manufactureYear:manufactureYEAR,
            Tires.tireCompany: tireComp
          ]
        DispatchQueue.main.async {
            self.db.collection("Tires").document(docRef.documentID).setData(data){ _ in
            self.tires.append(Tires(data: data))
          
            AuthViewModel.shared.updateKilometers(newKm:self.km)

//            self.fetchData()
            completion()
          }
      }
    }
    func calculateExpiredDate(date : Date)->(Date){
   
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 548, to: date)!
//        for the tires, it is year and a half approximately to the next chanage
        print(modifiedDate)
         return modifiedDate
    }
    
    func formatedExpiredDate(tires : Tires?)->String?{
        guard let tires = tires else {
          return nil
        }
//        let expDate = calculateExpiredDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        let formattedDate = formatter.string(from: tires.expiredDate)
        return formattedDate
    }
    
    func deleteTires(offsets: IndexSet) {
        guard let index = offsets.first else {return}
        let tires = self.tires[index]
        self.tires.remove(atOffsets: offsets)
        let tiresId = tires.id
        guard let carId = AuthViewModel.shared.car?.id else {return}
        let docRef = db.collection("Car").document(carId).collection("CarTires").document(tiresId)
        let docId = docRef.documentID
        db.collection("Car").document(carId).collection("CarTires").document(tiresId).delete()
        db.collection("Tires").document(tiresId).delete()  { err in
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
//    extension Date {
//    func generateYearUntilNow ()->[Int]{
//             var formattedDate: String? = ""
//
//             let format = DateFormatter()
//             format.dateFormat = "yyyy"
//             formattedDate = format.string(from: Date)
//
//     //        var yearsTillNow: [String] {
//                 var years = [Int]()
//                 for i in (Int(formattedDate!)!-70..<Int(formattedDate!)!+1).reversed() {
//                     years.append(i)
//                 }
//                 return years
//     //        }
//         }
//    }
//
//}


