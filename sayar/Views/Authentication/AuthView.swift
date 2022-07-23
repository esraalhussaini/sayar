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
    
   // @Published var isLoading : Bool = false

 
    
    
    
    
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
                
                Image("Logo")
                                   .resizable()
                                  .frame(width: 200, height: 50)
                                  .padding(.vertical,-50)
                                  .padding()
                               Text(LocalizedStringKey("EnterPhoneNumber"))
                    .font(.title2)
                                   .fontWeight(.regular)
               
                
                
                
                HStack{
                    
                  
                    TextField(LocalizedStringKey("EnterPhoneNumber"), text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.black, lineWidth: 0.5)
                    
                                            )
                        .padding()
                    
                    
                    
                    
                    
                }//HSTACK
                
       
                
                Button {
                    
                    authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber) { isSuccess in
                        print("DEBUG: phone \(isSuccess)")
                      //  self.showLoadingView()
                    }
                    
                } label: {
                    Text(LocalizedStringKey("CreateAccount"))
                        .accentColor(.red)
                    // .keyboardType(.numberPad)
                 
                }
                
            
                //---------------------------------------
           // if authManager.isLoading{LoadingView()}
                
              //
                
        //    self.showLoadingView()
                Divider()
              
                              .frame(height: 1)
                              .padding(.horizontal, 30)
                              .background(Color.white)
                
                TextField(LocalizedStringKey("EnterOPTCode"), text: $smsCode)
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
                    Text(LocalizedStringKey("VerifyCode"))
                    
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
                            Text(LocalizedStringKey("Cancel"))
                                .accentColor(.red)
                        })
                        
                    }//TOOL
                }//toolbar
                
                            Spacer()
            }//VSATCK
            .padding()
            
            
            
            Spacer()
            
            
            
            
            
            
            
            
            //
        }//NAV
        
    }
    
    
    
    
 
    
    
    
    
}

















//class

class AuthManager: ObservableObject {
//    @Published var isLoading : Bool = false
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
    
    
    
    
 
//
//    private func showLoadingView(){isLoading = true}
//    private func hideLoadingView(){isLoading = false}
    

}






