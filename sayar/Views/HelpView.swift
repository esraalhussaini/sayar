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

        NavigationView{

        VStack{
//            Text("")

            List{
                Section(header: Text(" Abou Us").listRowBackground(Color.clear)){
                    
                    Text("Markabah was founded by Melah a group of app development devotees, determined to deliver the best user experience worldwide.")
                }
                .listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
//                .border(.gray)

                
                
                Section(header: Text("Contact Us")){
                Text("Questions, comments or special requests? Get in touch today, we’re happy to help")
                    VStack(alignment: .leading){
                    Text("Markabah")
                    Text("Riyadh,Saudi Arabia")
                    Text("Support@Markabah.com")
                    } //.font(.callout)
                }.listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                
                Section(header: Text("Privacy Policy")){
                    VStack{
                    VStack(alignment: .leading){
                    Text("Last updated 2022")
                            .font(.footnote)
Spacer()
                        Text("Markabah application respects the privacy of our users and is fully committed to protecting their personal data and using it in accordance with data privacy laws. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our mobile application (Markabah). Please read this Privacy Policy carefully.")
                        
                        Text("IF YOU DO NOT AGREE WITH THE TERMS OF THIS PRIVACY POLICY, PLEASE DO NOT ACCESS THE APPLICATION.")
                        Spacer()
                        Text("We reserve the right to make changes to this Privacy Policy at any time and for any reason. We will alert you about any changes by updating the “Last updated” date of this Privacy Policy. You are encouraged to periodically review this Privacy Policy to stay informed of updates. You will be deemed to have been made aware of, will be subject to, and will be deemed to have accepted the changes in any revised Privacy Policy by your continued use of the Application after the date such revised Privacy Policy is posted")
                        
                            Text("This Privacy Policy does not apply to the third-party online/mobile store from which you install the Application or make payments, including any in-game virtual items, which may also collect and use data about you. We are not responsible for any of the data collected by any such third party.")
                    }
                    VStack(alignment: .leading){
                        Text("COLLECTION OF YOUR INFORMATION")
                            .bold()
                           Text("We may collect information about you in a variety of ways. The information we may collect via the Application depends on the content and materials you use, and includes:")
                         Text(" Personal Data")
                            .bold()
                        Text("Demographic and other personally identifiable information (such as your name and email address) that you voluntarily give to us when choosing to participate in various activities related to the Application, such as chat, posting messages in comment sections or in our forums, liking posts, sending feedback, and responding to surveys. If you choose to share data about yourself via your profile, online chat, or other interactive areas of the Application, please be advised that all data you disclose in these areas is public and your data will be accessible to anyone who accesses the Application.")
                        
                    }
                        VStack(alignment: .leading){
                          Text("Mobile Device Data")
                                .bold()
                      Text("Device information such as your mobile device ID number, model, and manufacturer, version of your operating system, phone number, country, location, and any other data you choose to provide.")
                      Text("Push Notifications")
                                .bold()
                      Text("We may request to send you push notifications regarding your account or the Application. If you wish to opt-out from receiving these types of communications, you may turn them off in your device’s settings.")
                      Text("Third-Party Data")
                                .bold()

                      Text("Information from third parties, such as personal information or network friends, if you connect your account to the third party and grant the Application permission to access this information.")
                        }
                        VStack(alignment: .leading){
                            Text("USE OF YOUR INFORMATION")
                                .bold()
                             Text("Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the Application to: ")
                            Text("1. Assist law enforcement and respond to subpoena.")
                            Text("2. Compile anonymous statistical data and analysis for use internally or with third parties.")
                            Text("3. Create and manage your account.")
                            Text("4. Deliver targeted advertising, coupons, newsletters, and other information regarding promotions and the Application to you.")
                            Text("5. Email you regarding your account or order.")
                            Text("6. Enable user-to-user communications.")
                        }
                            VStack(alignment: .leading){

                            Text("7. Fulfill and manage purchases, orders, payments, and other transactions related to the Application.")
                            Text("8. Generate a personal profile about you to make future visits to the Application more personalized.")
                            Text("9. Increase the efficiency and operation of the Application.")
                            Text("10. Monitor and analyze usage and trends to improve your experience with the Application.")
                            Text("11. Notify you of updates to the Application.")
                            Text("12. Offer new products, services, mobile applications, and/or recommendations to you.")
                            Text("13. Perform other business activities as needed.")
                            }
                                VStack(alignment: .leading){

                            Text("14. Prevent fraudulent transactions, monitor against theft, and protect against criminal activity.")
                            Text("15. Process payments and refunds.")
                            Text("16. Request feedback and contact you about your use of the Application.")
                            Text("17. Resolve disputes and troubleshoot problems.")
                            Text("18. Respond to product and customer service requests.")
                        }
                        
                        VStack(alignment: .leading){
                            Text("DISCLOSURE OF YOUR INFORMATION")
                                .bold()
                            Text("We may share information we have collected about you in certain situations. Your information may be disclosed as follows:")
                            Text("By Law or to Protect Rights")
                                .bold()
                            Text("If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation. This includes exchanging information with other entities for fraud protection and credit risk reduction.")
                            Text("Third-Party Service Providers")
                                .bold()

                            Text("We may share your information with third parties that perform services for us or on our behalf, including payment processing, data analysis, email delivery, hosting services, customer service, and marketing assistance.")
                            Text("Marketing Communications")
                                .bold()

                            Text("With your consent, or with an opportunity for you to withdraw consent, we may share your information with third parties for marketing purposes, as permitted by law.")
                            Text("Interactions with Other Users")
                                .bold()

                            Text("If you interact with other users of the Application, those users may see your name, profile photo, and descriptions of your activity, including sending invitations to other users, chatting with other users, liking posts, following blogs.")
                        }
                        VStack(alignment: .leading){

                            Text("Online Postings")
                                .bold()

                            Text("When you post comments, contributions or other content to the Applications, your posts may be viewed by all users and may be publicly distributed outside the Application in perpetuity")
                            Text("Third-Party Advertisers")
                                .bold()

                            Text("We may use third-party advertising companies to serve ads when you visit the Application. These companies may use information about your visits to the Application and other websites that are contained in web cookies in order to provide advertisements about goods and services of interest to you.")
                            
                            Text("Affiliates")
                                .bold()
                            Text("We may share your information with our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include our parent company and any subsidiaries, joint venture partners or other companies that we control or that are under common control with us.")
                            Text("Business Partners")
                                .bold()
                            Text("We may share your information with our business partners to offer you certain products, services or promotions.")
                        }
                            }
                    
                
                }.listRowBackground(Color.gray
                    .opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                    //.opacity(/*@START_MENU_TOKEN@*/0.1/*@END_MENU_TOKEN@*/))
                
//                Section(header: Text("Accessibility")){
//
//                }
                
              
            }.listStyle(.sidebar)
        }.navigationTitle("Help")
           
        }
    }
//        .toolbar{
//Button {
//print("button back")}
//        label: {
//            Text("Back")
////    Image("chevron.down")
////plusBottonOil
//
//}
//        }
//        //TOOLBAR
//
//.font(.title2)//button  plus
//.accentColor(.red)//button   plus
//        .ignoresSafeArea()
            
            
    }

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
