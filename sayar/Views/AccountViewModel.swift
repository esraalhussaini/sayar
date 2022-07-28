//
//
//
//
//
//
//
//  personalInformation.swift
//  Melah123
//
//  Created by Shaden Almuhaidib on 12/06/2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct AccountViewModel: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    let onSignout: () -> ()

    @State var showLoginPage: Bool = false
    @State var isPresentedNewPost: Bool = false
    

    init(onSignout: @escaping () -> ()) {
            UITableView.appearance().backgroundColor = .clear
            self.onSignout = onSignout
        }
   
        
        var body: some View {

            NavigationView {

                VStack(alignment: .leading){
                    Text("")
                    Text("")

                    Form{
                        Section{
                            Button{
                                print("Go to Personal information")
                            } label: {
                                HStack{
                                    Image("person.crop.circle")
                                        .resizable()
                                        .frame(width: 35, height: 35);                                    VStack(alignment: .leading){
                                        Text(LocalizedStringKey("Personalinformation"))
                                                .padding(.horizontal,10)
                                            Text(authViewModel.authUser?.phoneNumber ?? "+966000000000")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal,10)
                                    }
                                    
                                    Spacer()
//                                    Image("chevron.down")
//                                        .padding()
                                }.padding(3)
                            
                            }
                
                        
                            
                        
//            NavigationLink(destination: MyGarageH()) {
                       //
                 
                               
                            
                            
                
//                            Button{
//                                print("Go to Garage")
//                            } label: {
//                                HStack{
//                                    Image("sports-car 1")
//                                        .padding(.horizontal,-10)
//
//                                    Text(LocalizedStringKey("MyGarage"))
//                                 .padding(.horizontal,25)
//
////                                    Spacer()
////                                    Image("chevron.down")
////                                       .padding(.horizontal,-1)
//                                }
//
//                                .padding()
//                                .padding(.horizontal,2)
//                            }
           
//            }//nav
              
                            
                        }//section one
                        
             .listRowBackground(Color.gray
                             .opacity(0.1))
                        Section(header: Text(LocalizedStringKey("Support"))){
                         
                            NavigationLink(destination: HelpView().navigationTitle(LocalizedStringKey("Help"))){
                            Button{
                                print(LocalizedStringKey("Help"))
                            } label:{
                                HStack{
                                    Image("help 2")
                                        .padding(.horizontal,-7)
                                    Text(LocalizedStringKey("Help"))
                                        .padding(.horizontal,22)
//                                    Spacer()
//                                    Image("chevron.down")
//                                        .padding()
                                }.padding()
                            }

                            }.listRowBackground(Color.gray
                            .opacity(0.1))
                        }
                        Section{
                            
                            Text("")
                            //                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.852))
                            //                    .offset(x: 10, y: 0)
                            //
                            let currentUser = Auth.auth().currentUser

                            Button{
                                
                                if currentUser == nil || currentUser?.isAnonymous == true {
                                    showLoginPage.toggle()
                                }else{
                                    authViewModel.handleSignout(completion: onSignout)
                                }
                                //  try! Auth.auth().signOut()
                                print(LocalizedStringKey("SignOut"))
                            } label: {
                                HStack{
                                    
                                    if currentUser == nil || currentUser?.isAnonymous == true {
//                                        Image("Group 1724")
                                        Text(LocalizedStringKey("Login"))
                                            .foregroundColor(.blue)
                                    }else{
                                    Image("Group 1724")
                                    Text(LocalizedStringKey("SignOut"))
                                        .foregroundColor(.red)
                                    }
                                    
                                    
                                }
                            }
                        }
                    }
                   
                    .navigationTitle(LocalizedStringKey("Account"))
                    .navigationBarBackButtonHidden(true)
                    
                }
                .fullScreenCover(isPresented: $showLoginPage, content: {
                  AuthView(showLoginPage: $showLoginPage, isPresentedNewPost: $isPresentedNewPost)
                })
            }
            
            
            .accentColor(.black)
            }
      
            
        }


struct AccountViewModel_Previews: PreviewProvider {
    static var previews: some View {
        AccountViewModel(onSignout: {})
    }
}
