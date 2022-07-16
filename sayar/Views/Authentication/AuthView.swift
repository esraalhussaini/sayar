//
//  AuthView.swift
//  sayar
//
//  Created by anwar on 20/11/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            AuthView(showLoginPage: $, isPresentedNewPost: <#Binding<Bool>#>)
//        }
//    }
//}


struct AuthView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @State var isShowingHomeView: Bool = false
    @State var phoneNumber: String = ""
    @State var smsCode: String = ""
    @StateObject var authManager = AuthManager()
    @Binding var showLoginPage : Bool
    
    @Binding var isPresentedNewPost : Bool
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 20){
                
                Image("TabIconCar")
                
                Text("Enter Phone Number")
                    .font(.largeTitle).fontWeight(.heavy)
                
                
                
                HStack{
                    
                    // .padding(.top, 15)
                    TextField("Enter Phone Number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 0.5)
                            
                        )
                        .padding()
                    
                    
                    
                    
                    
                }//HSTACK
                
                
                
                //
                //                  Button(action: {
                //                      authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber) { isSuccess in
                //                        print("DEBUG: phone \(isSuccess)")}
                //                 self.showLoginPage.toggle()
                //
                //
                //                     // phonePad
                //                  }) {
                //                      Text("Send").frame(width: UIScreen.main.bounds.width - 30, height: 50)
                //                  }//label button
                //                  .foregroundColor(.white)
                //                  .background(Color.orange)
                //                      .cornerRadius(10)
                
                Button {
                    
                    authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber) { isSuccess in
                        print("DEBUG: phone \(isSuccess)")
                        
                    }
                    
                } label: {
                    Text("Create Account")
                        .accentColor(.red)
                    // .keyboardType(.numberPad)
                }
                
                
                
                Divider()
                
                TextField("Enter OPT Code", text: $smsCode)
                    .keyboardType(.numberPad)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 0.5)
                        
                    )
                    .padding()
                
                
                
                Button {
                    DispatchQueue.main.async {
                        authManager.verifySMSCode(verificationCode: smsCode, phoneNumber: phoneNumber) { isSuccess in
                            print("DEBUG: in code \(isSuccess)")
                            self.showLoginPage = false
                            self.isPresentedNewPost = true
                            //   isShowingHomeView.toggle()
                            authViewModel.isAouthenticatting = true
                        }
                    }
                } label: {
                    Text("Verify Code")
                    
                        .accentColor(.red)
                }
                
                
                .padding(.top, 15)
                .navigationBarTitle("")
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(true)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action : {
                            showLoginPage.toggle()
                        }, label: {
                            Text("Cancel")
                                .accentColor(.red)
                        })
                        
                    }//TOOL
                }//toolbar
                
                //                Spacer()
            }//VSATCK
            .padding()
            
            
            
            Spacer()
            
            
            
            
            
            
            
            
            //
        }//NAV
    }
}

















//class

class AuthManager: ObservableObject {
    @Published var verificationId: String?
    private let auth = Auth.auth()
    
    //تستقبل رقم الجوال
    func createUserWithPhoneNumber(phoneNumber: String, completion: @escaping ( (Bool) -> Void )) {
        print("DEBUG: 1 - preparing to request SMS Code")
        PhoneAuthProvider.provider().verifyPhoneNumber("+966" + phoneNumber, uiDelegate: nil) { [weak self] verificationId, error in
            print("DEBUG: 2 - Sending Request")
            if let error = error {
                print("DEBUG: error while getting verificationId \(error)")
            }
            guard let verificationId = verificationId else {
                completion(false)
                return
            }
            print("DEBUG: 3 - Successfully requested SMS Code")
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    
    
    //تتتآكد من رساله sms
    func verifySMSCode(verificationCode: String, phoneNumber: String , completion: @escaping ( (Bool) -> Void )) {
        print("DEBUG: 4 - Verifying SMS Code")
        guard let verificationId = verificationId else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId,
                                                                 verificationCode: verificationCode)
        print("DEBUG: 5 - Create Credential")
        auth.signIn(with: credential) { authResult, error in
            if let error = error {
                print("DEBUG: error while verifying smsCode \(error)")
            }
            print("DEBUG: 6 - Successfully Uploaded user info to firebase with saved phone number")
            guard let authResult = authResult else {return}
            let userId = authResult.user.uid
            let userData = [
                "id": userId,
                "phoneNumber": phoneNumber
            ]
            
            Firestore.firestore().collection("users").document(userId).setData(userData)
            completion(true)
        }
    }
}






//
////struct User
//struct User: Codable {
//    let id: String
//    let name: String
//    let phoneNumber: String
//}
//struct ScondPage: View {
//    @State var smsCode: String = ""
////   @State var code = ""
//    @Binding var show : Bool
//    @EnvironmentObject var authViewModel : AuthViewModel
//    @StateObject var authManager = AuthManager()
//    @Binding var phoneNumber: String
//    @Binding var isShowingHomeView: Bool
//    @Binding var isPresentedNewPost : Bool
//    @Binding var showLoginPage : Bool
//
//        var body: some View {
//
//            ZStack(alignment: .topLeading){
//
//                GeometryReader{_ in
//
//                    VStack(spacing: 20){
//                        Image("logo")
//
//                        Text("Verifiction code")
//                            .font(.largeTitle).fontWeight(.heavy)
//                        Text("Plesse Enter The Verifiction Code")
//                            .fontWeight(.bold)
//                            .foregroundColor(.gray).padding(.top, 12)
//
//                        TextField("Code", text: self.$smsCode)
//                                .keyboardType(.numberPad)
//
//                                 .padding()
//                                 .background(Color.green)
//                                 .clipShape(RoundedRectangle(cornerRadius: 10))
//                                // .padding(.top, 15)
//                                .padding(.top, 15)
//
//
//
//                                                        Button {
//                                                            DispatchQueue.main.async {
//                                                                authManager.verifySMSCode(verificationCode: smsCode, phoneNumber: phoneNumber) { isSuccess in
//                                                                    print("DEBUG: in code \(isSuccess)")}
//                                                                  self.showLoginPage = false
//                                                                   self.isPresentedNewPost = true
//                                                                   isShowingHomeView.toggle()
//                                                                    authViewModel.isAouthenticatting = true
//
//                                                            }
//                                                        } label: {
//                                                            Text("Verify Code")
//
//                                                                .accentColor(.red)
//                                                        }
////                        Button(action: {
////
////                        }) {
////                            Text("Verify").frame(width: UIScreen.main.bounds.width - 30, height: 50)
////                        }//label button
//                        .foregroundColor(.white)
//                        .background(Color.orange)
//                            .cornerRadius(10)
//                            .navigationBarTitle("")
//                            .navigationBarHidden(true)
//                            .navigationBarBackButtonHidden(true)
//                    }//VSATCK
//
//
//                }//GeometryReader
//
//                Button(action: {
//                    self.isShowingHomeView.toggle()
//                }) {
//                    Image(systemName: "chevron.left").font(.title)
//
//
//                }//button
//                .foregroundColor(.orange)
//
//            }//ZSTACK
//
//
//
//            .padding()
//        }
//        }
//
//
//
//
//
//
