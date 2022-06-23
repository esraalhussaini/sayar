//
//  AuthViewModel.swift
//  sayar
//
//  Created by anwar on 20/11/1443 AH.
//
import Firebase
import SwiftUI
import FirebaseCore
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    
    @Published var isAouthenticatting = false
    @Published var car : Car?
  
    
    static let shared = AuthViewModel()
    
    func fetchCar(){
        guard let uid = Auth.auth().currentUser?.uid  else {return}
        Firestore.firestore().collection("Car").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else{
                print("No data")
                return
            }
            self.car = Car(dictionary: data)
        }
    }
    
    
    
    
}




