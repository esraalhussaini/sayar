//
//  CarsDemoAnwar.swift
//  sayar
//
//  Created by anwar on 23/11/1443 AH.
//

import Foundation
//class CarsDemoAnwar: ObservableObject {
//  @Published var books = [Car]()
//
//  private var db = Firestore.firestore()
//  private var listenerRegistration: ListenerRegistration?
//
//  deinit {
//    unsubscribe()
//  }
//
//  func unsubscribe() {
//    if listenerRegistration != nil {
//      listenerRegistration?.remove()
//      listenerRegistration = nil
//    }
//  }
//
//  func subscribe() {
//    if listenerRegistration == nil {
//      listenerRegistration = db.collection("books").addSnapshotListener { (querySnapshot, error) in
//        guard let documents = querySnapshot?.documents else {
//          print("No documents")
//          return
//        }
//
//        self.books = documents.compactMap { queryDocumentSnapshot in
//          try? queryDocumentSnapshot.data(as: Car.self)
//        }
//      }
//    }
//  }
//
//  func removeBooks(atOffsets indexSet: IndexSet) {
//    let books = indexSet.lazy.map { self.books[$0] }
//    books.forEach { book in
//      if let documentId = car.id {
//        db.collection("books").document(documentId).delete { error in
//          if let error = error {
//            print("Unable to remove document: \(error.localizedDescription)")
//          }
//        }
//      }
//    }
//  }
//
//
//}
