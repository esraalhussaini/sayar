//
//  AuthView.swift
//  sayar
//
//  Created by anwar on 20/11/1443 AH.
//

import SwiftUI
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AuthView()
        }
    }
}


struct AuthView: View {

    @State var ccode = ""
     
     @State var no = ""
     
     @State var show = false
         var body: some View {
        
             VStack(spacing: 20){
                 Image("logo")
                 
                 Text("Verify your Number")
                     .font(.largeTitle).fontWeight(.heavy)
                 Text("Plesse Enter ypour Number")
                     .fontWeight(.bold)
                     .foregroundColor(.gray).padding(.top, 12)
                 
                 HStack{
                     TextField("+966", text: $ccode)
                         .keyboardType(.numberPad)
                         .frame(width: 45)
                          .padding()
                          .background(Color("TabMyCar"))
                          .clipShape(RoundedRectangle(cornerRadius: 10))
                         // .padding(.top, 15)
                     TextField("Number", text: $no)
                          .padding()
                          .background(Color("TabMyCar"))
                          .clipShape(RoundedRectangle(cornerRadius: 10))
                          .keyboardType(.numberPad)
                         // .padding(.top, 15)
                 }
                  .padding(.top, 15)
                 NavigationLink(destination: SecondOTP(show: $show) , isActive: $show){
           
                 
                 Button(action: {
                 self.show.toggle()
                     
                    // phonePad
                 }) {
                     Text("Send").frame(width: UIScreen.main.bounds.width - 30, height: 50)
                 }//label button
                 .foregroundColor(.white)
                 .background(Color.black)
                     .cornerRadius(10)
             
             }//navlinke
                     .navigationBarTitle("")
                     .navigationBarHidden(true)
                     .navigationBarBackButtonHidden(true)
     
                 
             }//VSATCK
             .padding()
         }
         }





    



    

