//
//  moreView.swift
//  sayar
//
//  Created by Shaden Almuhaidib on 27/06/2022.
//

import SwiftUI

struct HelpView: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
        
    }
    var body: some View {

//        NavigationView{
        VStack{

            List{
                Section(header: Text(LocalizedStringKey("AboutUs")).listRowBackground(Color.clear)){
                    
                    Text(LocalizedStringKey("Markabahwasfoundedby"))
                }
                .listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
//                .border(.gray)

                
                
                Section(header: Text(LocalizedStringKey("ContactUs"))){
                Text(LocalizedStringKey("Questionscommentsorspecialrequests"))
                    VStack(alignment: .leading){
                    Text(LocalizedStringKey("Markabah"))
                    Text(LocalizedStringKey("Riyadh"))
                    Text("Support@Markabah.com")
                    } //.font(.callout)
                }.listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                
                Section(header: Text(LocalizedStringKey("PrivacyPolicy"))){
                    VStack{
                    VStack(alignment: .leading){
                    Text(LocalizedStringKey("Lastupdated2022"))
                            .font(.footnote)
Spacer()
                        Text(LocalizedStringKey("Markabahapplicationrespectstheprivacyof"))
                        
                        Text(LocalizedStringKey("IFYOUDONOTAGREE"))
                        Spacer()
                        Text(LocalizedStringKey("PrivacyPolicy2"))
                        
                            Text(LocalizedStringKey("ThisPrivacyPolicydoesnotapplytothethirdparty"))
                    }
                    VStack(alignment: .leading){
                        Text(LocalizedStringKey("COLLECTIONOFYOURINFORMATION"))
                            .bold()
                           Text(LocalizedStringKey("Wemaycollectinfo"))
                         Text(LocalizedStringKey("PersonalData"))
                            .bold()
                        Text(LocalizedStringKey("Demographicandotherpersonallyidentifiableinfo"))
                        
                    }
                        VStack(alignment: .leading){
                          Text(LocalizedStringKey("MobileDeviceData"))
                                .bold()
                      Text(LocalizedStringKey("Deviceinformationsuchasyourmobiledevice"))
                      Text(LocalizedStringKey("PushNotifications"))
                                .bold()
                      Text(LocalizedStringKey("Wemayrequesttosendyoupush"))
                      Text(LocalizedStringKey("ThirdPartyData"))
                                .bold()

                      Text(LocalizedStringKey("Informationfromthirdparties"))
                        }
                        VStack(alignment: .leading){
                            Text(LocalizedStringKey("USEOFYOURINFORMATION"))
                                .bold()
                             Text(LocalizedStringKey("Havingaccurateinfo"))
                            Text(LocalizedStringKey("text1"))
                            Text(LocalizedStringKey("text2"))
                            Text(LocalizedStringKey("text3"))
                            Text(LocalizedStringKey("text4"))
                            Text(LocalizedStringKey("text5"))
                            Text(LocalizedStringKey("text6"))
                        }
                            VStack(alignment: .leading){

                            Text(LocalizedStringKey("text7"))
                            Text(LocalizedStringKey("text8"))
                            Text(LocalizedStringKey("text9"))
                            Text(LocalizedStringKey("text10"))
                            Text(LocalizedStringKey("text11"))
                            Text(LocalizedStringKey("text12"))
                            Text(LocalizedStringKey("text13"))
                            }
                                VStack(alignment: .leading){

                            Text(LocalizedStringKey("text14"))
                            Text(LocalizedStringKey("text15"))
                            Text(LocalizedStringKey("text16"))
                            Text(LocalizedStringKey("text17"))
                            Text(LocalizedStringKey("text18"))
                        }
                        
                        VStack(alignment: .leading){
                            Text(LocalizedStringKey("DISCLOSUREOFYOURINFORMATION"))
                                .bold()
                            Text(LocalizedStringKey("text19"))
                            Text(LocalizedStringKey("text20"))
                                .bold()
                            Text(LocalizedStringKey("text21"))
                            Text(LocalizedStringKey("text22"))
                                .bold()

                            Text(LocalizedStringKey("text23"))
                            Text(LocalizedStringKey("text24"))
                                .bold()

                            Text(LocalizedStringKey("text25"))
                            Text(LocalizedStringKey("text26"))
                                .bold()

                            Text(LocalizedStringKey("text27"))
                        }
                        VStack(alignment: .leading){

                            Text(LocalizedStringKey("text28"))
                                .bold()

                            Text(LocalizedStringKey("text29"))
                            Text(LocalizedStringKey("text30"))
                                .bold()

                            Text(LocalizedStringKey("text31"))
                            
                            Text(LocalizedStringKey("text32"))
                                .bold()
                            Text(LocalizedStringKey("text33"))
                            Text(LocalizedStringKey("text34"))
                                .bold()
                            Text(LocalizedStringKey("text35"))
                        }
                            }
                    
                
                }.listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                    //.opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                
//                Section(header: Text("Accessibility")){
//
//                }
                
              
            }.listStyle(.sidebar)
        }
//        .navigationTitle("Help")
//                .toolbar {
//                    ToolbarItem(placement:.navigationBarLeading){
//                        Button(){
//                            print("Back Pressed")
//                        } label: {
//                            Image(systemName: "chevron.left")
//                        }
//                    }
//                }
//      }  .ignoresSafeArea()
    }

            
    }

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
