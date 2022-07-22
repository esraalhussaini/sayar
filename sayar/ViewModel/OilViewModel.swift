

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
    @Published var oilCompany : String = ""
    @Published var oilType : String = ""
    
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
        self.oil = []
            guard let carId = AuthViewModel.shared.car?.id else {
                print("No car 📌")
                return}
            self.db.collection("Car").document(carId).collection("CarOil").getDocuments { snapshot, error in
                
                
                DispatchQueue.main.async {
                if let docs = snapshot?.documents{
                    docs.forEach { doc in
                        let docId = doc.documentID
                        self.db.collection("Oil").document(docId).getDocument { snapshot, error in
                            guard let docData = snapshot?.data() else {return}
                            let oil = Oil(data: docData)
                            print(oil.cost,"🤚🏻")
                            self.oil.append(oil)
                        }
                    }
                    }
                    
                }
                
            }

    }
    
    func uploadOil(completion:@escaping ()->()){
        //        guard let user =  AuthViewModel.shared.user else {return}
        //          guard caption != "" else {
        //              print("Please, type something")
        //              return}
        guard !costString.isEmpty else {
            self.appError = .emptyCost
            return
        }
        let expDate = calculateExpiredDate(date: date, oilType: oilType)
        guard let carId = AuthViewModel.shared.car?.id else {
            print("no car")
            completion()
            return}
        let docRef = db.collection("Car").document(carId).collection("CarOil").document()
        //          let docRef = db.collection("Oil").document()
        docRef.setData(["id": docRef.documentID])
        let data : [String:Any] = [
            Oil.cost : cost ,
            Oil.id:docRef.documentID,
            Oil.carID: carId,
            Oil.date: date,
            Oil.km: km,
            Oil.expiredDate: expDate,
            Oil.oilCompany: oilCompany,
            Oil.oilType: oilType
            
        ]
        DispatchQueue.main.async {
            self.db.collection("Oil").document(docRef.documentID).setData(data){ _ in
            print("Uploading Successfully , 📌")
            self.oil.append(Oil(data: data))
            print(self.oil.count,"📌")
            AuthViewModel.shared.updateKilometers(newKm:self.km)
//            self.fetchData()
            completion()
            
        }
    }
    }
    //    func calculateExpiredDate2(){
    //        guard let carId = AuthViewModel.shared.car?.id else {
    //
    //            return}
    //    }
    func calculateExpiredDate(date : Date, oilType : String )->Date{
        
        
//        let today = date
       
        var value = 0
        //        let modifiedDate = Calendar.current.date(byAdding: .day, value: 0, to: today)!
        if oilType == "3" || oilType == "5" || oilType == "8" {
            value = 183
            // for the oil of 3,5,8 months, it is six months approximately to the next chanage
        }
        else if oilType == "10" || oilType == "15" {
            value = 240
            // for the oil of 10,15 months, it is eight months approximately to the next chanage
        }
        let modifiedDate = Calendar.current.date(byAdding: .day, value: value, to: date)!
        //        let formatter = DateFormatter()
        //        formatter.dateFormat = "E, d MMM y"
        //        let formattedDate = formatter.string(from: modifiedDate)
        print("Thanh \(modifiedDate)")
        return modifiedDate
        
    }
    func formatedExpiredDate(oil : Oil?)->String? {
        guard let oil = oil else {
            return nil
        }

//        guard let lastOild = oil.last else {return nil}
//        let lastOildDate = oil.date
//        let lastOildType = oil.oilType
//        let expDate = calculateExpiredDate(date: lastOildDate,oilType:lastOildType)
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM y"
        let formattedDate = formatter.string(from: oil.expiredDate)
        return formattedDate
    }
    func deleteOil(offsets: IndexSet) {
//        let fuelId = fuel.id
        
        guard let index = offsets.first else {return}
        let oil = self.oil[index]
        self.oil.remove(atOffsets: offsets)
        let oilId = oil.id
        guard let carId = AuthViewModel.shared.car?.id else {return}
        let docRef = db.collection("Car").document(carId).collection("CarOil").document(oilId)
        let docId = docRef.documentID
        db.collection("Car").document(carId).collection("CarOil").document(oilId).delete()
        db.collection("Oil").document(oilId).delete()  { err in
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
