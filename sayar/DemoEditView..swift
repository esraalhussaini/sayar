//
//  DemoEditView..swift
//  sayar
//
//  Created by anwar on 23/11/1443 AH.
//

import SwiftUI




enum Mode {
  case new
  case edit
}
 
enum Action {
  case delete
  case done
  case cancel
}

struct DemoEditView_: View {

//    @Environment(\.presentationMode) private var presentationMode
//      @State var presentActionSheet = false
//
//
//      @ObservedObject var viewModel = CarViewModelDemo()
//      var mode: Mode = .new
//      var completionHandler: ((Result<Action, Error>) -> Void)?
       
//
//      var cancelButton: some View {
          
          
     
//        Button(action: { self.handleCancelTapped() }) {
//          Text("Cancel")
//        }
//      }
//
//      var saveButton: some View {
//        Button(action: { self.handleDoneTapped() }) {
//          Text(mode == .new ? "Done" : "Save")
//        }
//        .disabled(!viewModel.modified)
//      }
//
   var body: some View {
       Text("jnjnnj")
//        NavigationView {
//          Form {
//            Section(header: Text("Book")) {
//              TextField("Title", text: $viewModel.car.title)
//              TextField("Number ", value: $viewModel.car.number, formatter: NumberFormatter())
//            }
//
//            Section(header: Text("A")) {
//              TextField("Ath", text: $viewModel.car.a)
//            }
//
//            Section(header: Text("Photo")) {
//                TextField("Image", text: $viewModel.book.image)
//            }
//
//            if mode == .edit {
//              Section {
//                Button("Delete book") { self.presentActionSheet.toggle() }
//                  .foregroundColor(.red)
//              }
//            }
//          }
//          .navigationTitle(mode == .new ? "New car" : viewModel.car.title)
//          .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
//          .navigationBarItems(
//            leading: cancelButton,
//            trailing: saveButton
//          )
//          .actionSheet(isPresented: $presentActionSheet) {
//            ActionSheet(title: Text("Are you sure?"),
//                        buttons: [
//                          .destructive(Text("Delete book"),
//                                       action: { self.handleDeleteTapped() }),
//                          .cancel()
//                        ])
//          }
//        }
//      }
//
//      func handleCancelTapped() {
//        self.dismiss()
//      }
//
//      func handleDoneTapped() {
//        self.viewModel.handleDoneTapped()
//        self.dismiss()
//      }
//
//      func handleDeleteTapped() {
//        viewModel.handleDeleteTapped()
//        self.dismiss()
//        self.completionHandler?(.success(.delete))
//      }
//
//      func dismiss() {
//        self.presentationMode.wrappedValue.dismiss()
      }
    }
     

    
    
    
    
    
    
    
    
    
    
//struct DemoEditView__Previews: PreviewProvider {
//    static var previews: some View {
//        let car = Car(title: "Coder", author: "Cairocoders", numberOfPages: 89, image: "photo1")
//        let CarViewModelDemo = CarViewModelDemo(car: car)
//        return DemoEditView_(viewModel: CarViewModelDemo, mode: .edit
//
//
//    }
//}
