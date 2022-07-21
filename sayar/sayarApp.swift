//sayyar App
//
//  sayarApp.swift #########################################################################
//  sayar
//
//  Created by ESRA ALHUSSAINI on 24/05/2022.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAuth
import FirebaseMessaging
import UserNotificationsUI

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var fcmRegTokenMessage: String = ""
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().isAutoInitEnabled = true

        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
    }



    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")

        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
                self.fcmRegTokenMessage  = "Remote FCM registration token: \(token)"
            }
        }
    }


    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(.noData)
            return
        }
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }
    
 
    
    
    
 
//
    

   
    
    
    
    
}//class


//
//

 
    
@main
struct sayarApp: App {
    //Athn and Firebase CRUD
    
@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //Firbase  initialization code
  //  init(){ FirebaseApp.configure()}
    
    
    //image
    
    @StateObject var fuelViewModel = FuelViewModel()
    @StateObject var oilViewModel = OilViewModel()
    @StateObject var tiresViewModel = TiresViewModel()
    @StateObject var batteryViewModel = BatteryViewModel()
    
   @StateObject var vImage = ViewModel()
    
    var body: some Scene {
  WindowGroup {
    //AccountViewModel()

TabViewApp()
          .environmentObject(AuthViewModel.shared)
          .preferredColorScheme(.light)
      
     // imagePicker
          .environmentObject(vImage)
          .environmentObject(fuelViewModel)
          .environmentObject(oilViewModel)
          .environmentObject(batteryViewModel)
          .environmentObject(tiresViewModel)
          .onAppear {
              UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
          }
      
       }
    }
}

