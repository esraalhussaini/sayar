


import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore


class OilViewModel: ObservableObject{
    
    @Published var oil = [Oil]()
    init(){
        fetchData()
    }

        private var db = Firestore.firestore()
    
    func fetchData(){
        
        db.collection("Oil").getDocuments {snapdhot, error in
            guard error == nil else {
                print("Error \(error)")
                return
            }
            
            if let docs = snapdhot?.documents{
                docs.forEach { doc in
                      let oil = Oil(data: doc.data())
                    print(oil.cost,"🤚🏻")
                    self.oil.append(oil)
                }
                
            }
            
            
            
        }

    }


}
