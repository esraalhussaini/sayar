//
//  SecondOTP.swift
//  sayar
//
//  Created by anwar on 20/11/1443 AH.
//

import SwiftUI

struct SecondOTP: View {
   
    @State var code = ""
     @Binding var show : Bool
    
         var body: some View {
             
             ZStack(alignment: .topLeading){
                 
                 GeometryReader{_ in
                     
                     VStack(spacing: 20){
                         Image("logo")
                         
                         Text("Verifiction code")
                             .font(.largeTitle).fontWeight(.heavy)
                         Text("Plesse Enter The Verifiction Code")
                             .fontWeight(.bold)
                             .foregroundColor(.gray).padding(.top, 12)
                         
                         TextField("Code", text: self.$code)
                                 .keyboardType(.numberPad)
                          
                                  .padding()
                                  .background(Color("TabMyCar"))
                                  .clipShape(RoundedRectangle(cornerRadius: 10))
                                 // .padding(.top, 15)
                                 .padding(.top, 15)
                         
                         Button(action: {
                                 
                         }) {
                             Text("Verify").frame(width: UIScreen.main.bounds.width - 30, height: 50)
                         }//label button
                         .foregroundColor(.white)
                         .background(Color.black)
                             .cornerRadius(10)
                             .navigationBarTitle("")
                             .navigationBarHidden(true)
                             .navigationBarBackButtonHidden(true)
                     }//VSATCK
                     
                     
                 }//GeometryReader
                 
                 Button(action: {
                     self.show.toggle()
                 }) {
                     Image(systemName: "chevron.left").font(.title)
                     
                     
                 }//button
                 .foregroundColor(.orange)
                 
             }//ZSTACK
             
             

             .padding()
         }
         }





    


