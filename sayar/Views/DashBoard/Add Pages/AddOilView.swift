//
//  AddFuel View.swift
//  sayar
//
//  Created by Razan Altamimi on 08/11/1443 AH.
//

//
// AddFuel View.swift
// sayar
//
// Created by Razan Altamimi on 08/11/1443 AH.
//

import SwiftUI

struct AddOilView: View {

  @State private var isShowingDialog = false
  @State private var selected = 0
  @EnvironmentObject var vm : OilViewModel
  var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"

  //Pluse button



    @Binding var isPresented: Bool

//  @Binding var DATE: Date
   // @Binding var DATE = Date()
//  @Binding var cost : String
//  @Binding var km : String
//  @Binding var ExpectedTime : String
  //@Binding var cost : String
    //Km Double or int?


    var body: some View {

      NavigationView{
        ZStack{

          Color.gray.opacity(0.1)

          VStack(alignment: .center , spacing: 10){
//            Spacer()
//            Image(“DefualtCar”)
//        //button
//            Text(“Add Photo”)

//            VStack {
//             Picker(“Please choose a color”, selection: $selectedColor) {
//               ForEach(colors, id: \.self) {
//                 Text($0)
//               }
//             }
//             Text(“You selected: \(selectedColor)“)
//            }

            Form{


            Section{

              DatePicker("Pick a date", selection: $vm.date, displayedComponents: .date)
              // TextField(“Make”, text:$titel)
              // TextField(“Model”, text: $post )

            }

                Section{
                  TextField("SAR", text:$vm.costString)
                    .keyboardType(.numberPad)


                }


              Section{
                TextField("km", text:$vm.kmString)
                  .keyboardType(.numberPad)


              }

              Section{


                TextField("oil Type", text:$vm.oilType)
                  .keyboardType(.twitter)

                TextField("oil Company", text:$vm.oilCompany)
                  .keyboardType(.twitter)



             //  }


            }

//              Section{
//                TextField(“ExpectedTime”, text:$ExpectedTime)
//                  .keyboardType(.numberPad)
//
//
//
//              }



       }//form













   Spacer()
              .padding(.bottom)




          }//VSTACK IMAGE


        }//zstack importent







        .navigationBarTitle("Add Oil", displayMode: .inline)
     .navigationBarItems(leading:leading  ,trailing: trailing)


     .ignoresSafeArea(.all, edges: .bottom)
     .alert(item: $vm.appError) { alert in
       Alert(title: Text(""), message: Text("\(alert.localizedDescription)"))
     }

      }//NavgationView
    }//varBody1




    //Cancel
    var leading: some View {

      Button(action : {
        isPresented.toggle()
      }, label: {
        Text("Cancel")
          .accentColor(.red)
      })



    }//VarBody2


  //Done
    var trailing: some View {

      Button(action : {
        vm.uploadOil{}
        isPresented.toggle()
      }, label: {
        Text("Done")
          .accentColor(.red)

      })



    }//VarBody3
}//StructView
