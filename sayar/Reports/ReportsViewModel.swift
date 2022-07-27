//
//  ReportsViewModel.swift
//  sayar
//
//  Created by ESRA ALHUSSAINI on 17/07/2022.
//

import Foundation
//nouf
import Firebase
import FirebaseCore
import FirebaseFirestore
//nouf


class ReportViewModel: ObservableObject {
    var tireTotal  = 0.0
    var oilTotal  = 0.0
    var batteryTotal  = 0.0
    var fuelTotal  = 0.0
    /// update this cardId with user.carID when integrate with login
//    var carId = "ZCXhXvkFW1ll0fUYsc79"
    var carId = AuthViewModel.shared.car?.id //nouf
    
    @Published var isLoading = true
    @Published var noDataFound = false
    @Published var arrayOfValues:[Double] = [0,0.0,0.0,0.0]
    private var db = Firestore.firestore()
    /// Update the data when data is fetched from all 4 function of firebase colllection
    var hitCount: Int = 4 {
        didSet{
            print(hitCount)
            if hitCount == 0 {
                updateArrayValues()
            }
        }
    }
    /// Update the data that is used to draw PieChart
    func updateArrayValues(){
        arrayOfValues = [fuelTotal,batteryTotal,oilTotal,tireTotal]
        if arrayOfValues.reduce(0, {$0 + $1}) == 0{
            noDataFound = true
        }
        isLoading = false
    }

    /// Make calls to firebase function
    /// - Parameter searchBy: searchBy it contain value for week, month, year
    func makeNetworkCall(searchBy: ReportSearchBy){
        hitCount = 4
        noDataFound = false
        isLoading = true

        var compareDate: Date?
        switch searchBy {
        case .week:
            /// go seven days back
            compareDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        case .month:
            /// go 1 month  back approx
            compareDate = Calendar.current.date(byAdding: .day, value: -30, to: Date())
        case .year:
            /// go 1 year  back approx
            compareDate = Calendar.current.date(byAdding: .day, value: -365, to: Date())
        }
        if let modifiedDate = compareDate{
            fetchCarBatteryCost(carID: carId ?? "",fromDate: modifiedDate)
            fetchCarOilCost(carID: carId ?? "",fromDate: modifiedDate)
            fetchCarFuelCost(carID: carId ?? "",fromDate: modifiedDate)
            fetchCarTireCost(carID: carId ?? "",fromDate: modifiedDate)
        }
    }
    func fetchCarBatteryCost(carID: String, fromDate: Date ){
        let myCurrentDate = Date();
        //nouf
        guard let carId = AuthViewModel.shared.car?.id else {return}
//      db.collection("Car").document(carId).collection("CarBattery")
        db.collection("Battery").whereField("date", isGreaterThanOrEqualTo: fromDate).whereField("date",  isLessThanOrEqualTo: myCurrentDate).whereField("carID", isEqualTo:  carId).getDocuments {
            //nouf
            
            snapshots, error in
            var sum = 0.0
            guard let snapshot = snapshots else{
                print(error.debugDescription)
                self.batteryTotal = sum
                self.hitCount += -1
                return
            }
            for document in snapshot.documents {
                sum = sum + ((document.get("cost") as? Double)  ?? 0.0)
            }
            self.batteryTotal = sum
            self.hitCount += -1
        }
    }
    func fetchCarOilCost(carID: String, fromDate: Date ){
        let myCurrentDate = Date();
        //nouf
        guard let carId = AuthViewModel.shared.car?.id else {return}
//      db.collection("Car").document(carId).collection("CarBattery")
        db.collection("Oil").whereField("date", isGreaterThanOrEqualTo: fromDate).whereField("date",  isLessThanOrEqualTo: myCurrentDate).whereField("carID", isEqualTo:  carId).getDocuments {
            //nouf
            
            snapshots, error in
            var sum = 0.0
            guard let snapshot = snapshots else{
                print(error.debugDescription)
                self.oilTotal = sum
                self.hitCount += -1
                return
            }
            for document in snapshot.documents {
                sum = sum + ((document.get("cost") as? Double)  ?? 0.0)
            }
            self.oilTotal = sum
            self.hitCount += -1

        }
    }
    func fetchCarTireCost(carID: String, fromDate: Date ){
        let myCurrentDate = Date();
        
        //nouf
        guard let carId = AuthViewModel.shared.car?.id else {return}
//      db.collection("Car").document(carId).collection("CarBattery")
        db.collection("Tires").whereField("date", isGreaterThanOrEqualTo: fromDate).whereField("date",  isLessThanOrEqualTo: myCurrentDate).whereField("carID", isEqualTo: carId).getDocuments {
    //nouf
            snapshots, error in
            var sum = 0.0
            guard let snapshot = snapshots else{
                print(error.debugDescription)
                self.tireTotal = sum
                self.hitCount += -1
                return
            }
            for document in snapshot.documents {
                sum = sum + ((document.get("cost") as? Double)  ?? 0.0)
                //print("\(document.documentID) => \(document.data())")
            }
            self.tireTotal = sum
            self.hitCount += -1

        }
    }
    func fetchCarFuelCost(carID: String, fromDate: Date ){
        let myCurrentDate = Date();
        
//        AuthViewModel.shared.db.collection(AuthViewModel.shared.fuelCollection).whereField("date", isGreaterThanOrEqualTo: fromDate).whereField("date",  isLessThanOrEqualTo: myCurrentDate).whereField("carID", isEqualTo:  carID).getDocuments {
        
//nouf
        guard let carId = AuthViewModel.shared.car?.id else {return}
//      db.collection("Car").document(carId).collection("CarBattery")
        db.collection("Fuel").whereField("date", isGreaterThanOrEqualTo: fromDate).whereField("date",  isLessThanOrEqualTo: myCurrentDate).whereField("carID", isEqualTo:  carId).getDocuments {
//nouf
            snapshots, error in
            var sum = 0.0
            guard let snapshot = snapshots else{
                print(error.debugDescription)
                self.fuelTotal = sum
                self.hitCount += -1
                return
            }
            for document in snapshot.documents {
                sum = sum + ((document.get("cost") as? Double)  ?? 0.0)
                //print("\(document.documentID) => \(document.data())")
            }
            self.fuelTotal = sum
            self.hitCount += -1

        }
    }
}
enum ReportSearchBy: Int{
    case week = 0
    case month = 1
    case year = 2
}
