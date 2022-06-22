


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class BatteryViewModel: ObservableObject{
    
    @Published var battery = [Battery]()
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


}
