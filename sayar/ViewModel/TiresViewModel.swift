


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class TiresViewModel: ObservableObject{
    
    @Published var tires = [Tires]()
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


}
