//
//  BordingView.swift
//  sayar
//
//  Created by anwar on 24/12/1443 AH.
//

import Foundation

import SwiftUI



    struct BordingView: View {
        @Binding var showOnbording: Bool
        var body: some View {
            
//            VStack{
//
//                     Button {
//
//                     } label: {
//                         Image("0")
//                             .resizable()
//                             .renderingMode(.template)
//                             .foregroundColor(Color("ColorApp"))
//                             .frame(width: 70, height: 50)
//                     }
//                     .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
//                     .padding()
//            }
//            كود اللوقو من فوق
            
            
            TabView{
                BView(title:"Markabah" ,subtitle:"Welcome to Markabah." ,imageName: "1",
                      showsDismissButton: false,
                      showOnbording: $showOnbording
                )

                BView(title:"Track your car expenses" ,subtitle:"" ,imageName: "2",
                      showsDismissButton: false,
                      showOnbording: $showOnbording
                )


                BView(title:"Be aware of your vehicle required maintenance" ,subtitle:"START." ,imageName: "3",
                      showsDismissButton: true,
                      showOnbording: $showOnbording
                )
           
            }
            .tabViewStyle(PageTabViewStyle())

        }}

    struct BView: View {
        let title: String
        let subtitle: String
        let  imageName: String
        let  showsDismissButton: Bool
        @Binding var showOnbording: Bool
        var body: some View {
            VStack{
              Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding()
                Text(title)
                    .font(.system(size: 32))
                    .padding()

                Text(subtitle)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding()
            
                if    showsDismissButton {
                    Button(action: {
                        showOnbording.toggle()

                    } , label:{
                      Text("GET")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50 )
                            .background(Color.green)
                            .cornerRadius(6)
                    })

                }//if

            }

        }}


