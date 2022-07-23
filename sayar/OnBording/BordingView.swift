//
//  BordingView.swift
//  sayar
//
//  Created by anwar on 24/12/1443 AH.
//

import Foundation

import SwiftUI

import UIKit


    struct BordingView: View {
//
        
        @Binding var showOnbording: Bool
//        var screenSize: CGSize
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
//                             .frame(width: 60, height: 40)
//                     }
//                     .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
//                     .padding()
//            }
//            كود اللوقو من فوق
            
            
            TabView{
                BView(title:"Markabah" ,subtitle:"Welcome to Markabah." ,imageName: "11",
                      showsDismissButton: false,
                      showOnbording: $showOnbording
                )

                BView(title:"Track your car expenses" ,subtitle:"" ,imageName: "222",
                      showsDismissButton: false,
                      showOnbording: $showOnbording
                )

            
                BView(title:"Be aware of your vehicle required maintenance" ,subtitle:"" ,imageName: "333",
                      showsDismissButton: true,
                      showOnbording: $showOnbording
                )
       
            }
       
          
               //  setupAppearance()
            .onAppear(){
                  UIPageControl.appearance().currentPageIndicatorTintColor = .red
                  UIPageControl.appearance().pageIndicatorTintColor = .gray
                  UIPageControl.appearance().tintColor = .gray
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
              Image(imageName)
                    .resizable()
                  // .aspectRatio(contentMode: .fit)
                   .scaledToFill()
                 //.frame(minWidth:100,maxWidth: .infinity)
                   .offset(y:-90)
              .frame(width: 300, height: 150)
         
//                    .frame(height: screenSize.height / 3)
                .padding()

//                    .padding()
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
                      Text("START")
                            .bold()
                            .foregroundColor(Color.white)
                            //.fill(Color("TabMyCar"))
                            .frame(width: 200, height: 50 )
                            .background(Color("ColorApp"))
                            .cornerRadius(6)
                    })

                }//if
             
   
              //  tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
           // .offset(y: -200)
           // .ignoresSafeArea()
        }}

