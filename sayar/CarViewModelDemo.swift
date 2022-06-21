//
//  CarViewModelDemo.swift
//  sayar
//
//  Created by anwar on 23/11/1443 AH.
//

import SwiftUI
import Foundation
import Combine
import FirebaseFirestore
//struct CarViewModelDemo: View {
    
  
//
//   class CarViewModelDemo: ObservableObject {
//
//     @Published var car: Car
//     @Published var modified = false
//
//     private var cancellables = Set<AnyCancellable>()
//
//       init(car: Car = Car(title: "", author: "", numberOfPages: 0, image: "")) {
//       self.car = car
//
//       self.$car
//         .dropFirst()
//         .sink { [weak self] car in
//           self?.modified = true
//         }
//         .store(in: &self.cancellables)
//     }
//
//     private var db = Firestore.firestore()
//
//     private func addBook(_ car: Car) {
//       do {
//         let _ = try db.collection("books").addDocument(from: car)
//       }
//       catch {
//         print(error)
//       }
//     }
//
//     private func updateBook(_ car: Car) {
//       if let documentId = car.id {
//         do {
//           try db.collection("books").document(documentId).setData(from: car)
//         }
//         catch {
//           print(error)
//         }
//       }
//     }
//
//     private func updateOrAddBook() {
//       if let _ = car.id {
//         self.updateBook(self.car)
//       }
//       else {
//         addBook(car)
//       }
//     }
//
//     private func removeBook() {
//       if let documentId = car.id {
//         db.collection("books").document(documentId).delete { error in
//           if let error = error {
//             print(error.localizedDescription)
//           }
//         }
//       }
//     }
//
//     func handleDoneTapped() {
//       self.updateOrAddBook()
//     }
//
//     func handleDeleteTapped() {
//       self.removeBook()
//     }
//
//   }
//












//
//struct CarViewModelDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        CarViewModelDemo()
//    }
//}
