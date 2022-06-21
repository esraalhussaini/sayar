//
//  Demo3Anwar.swift
//  sayar
//
//  Created by anwar on 23/11/1443 AH.
//

import SwiftUI

//struct Demo3Anwar: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}




struct Demo3Anwar: View {
   
//  @Environment(\.presentationMode) var presentationMode
//  @State var presentEditBookSheet = false
//
//
//  var car: Car
   
//  private func editButton(action: @escaping () -> Void) -> some View {
//    Button(action: { action() }) {
//      Text("Edit")
//    }
//  }
//
  var body: some View {
      
      Text("jbj")
//    Form {
//      Section(header: Text("Car")) {
//        Text(car.title)
//        Text("\(car.CarManufactureYears) CarManufactureYear")
//      }
//
//      Section(header: Text("CarModel")) {
//        Text(car.CarModel)
//      }
//      Section(header: Text("Photo")) {
//          AnimatedImage(url: URL(string: car.image)!).resizable().frame(width: 300, height: 300)
//      }
//    }
//    .navigationBarTitle(car.title)
//    .navigationBarItems(trailing: editButton {
//      self.presentEditBookSheet.toggle()
//    })
//    .onAppear() {
//      print("Demo3Anwar.onAppear() for \(self.car.title)")
//    }
//    .onDisappear() {
//      print("Demo3Anwar.onDisappear()")
//    }
//    .sheet(isPresented: self.$presentEditBookSheet) {
//     DemoEditView_(viewModel: Demo3Anwar(car: car), mode: .edit) { result in
//        if case .success(let action) = result, action == .delete {
//          self.presentationMode.wrappedValue.dismiss()
//        }
//      }
//    }
  }
   
}
 























struct Demo3Anwar_Previews: PreviewProvider {
    static var previews: some View {
//        
//        let car = Car(title: "Coder", aut: "Cas", numbe: 23, image: "photo1")
//        return
//          NavigationView {
            //  Demo3Anwar(car: car)
              Demo3Anwar()
//          }
    
    }
}
