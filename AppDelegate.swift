//
//  AppDelegate.swift
//  ManatthanChallenge
//
//  Created by Vincenzo Izzo on 13/12/17.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit
import CloudKit
import UserNotifications
import NotificationCenter
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let database = Database.shared
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let publicDatabase = database.publicDatabase
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            //Parse errors and track state
        }
        
        let generalCategory = UNNotificationCategory(identifier: "GENERAL",
                                                     actions: [],
                                                     intentIdentifiers: [],
                                                     options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([generalCategory])
        
        
        application.registerForRemoteNotifications()
        
        let subscription = CKDatabaseSubscription(subscriptionID:"Subscription")

        publicDatabase.save(subscription) { (subscription, error) in
        
            
        }
        
//        Bookings.shared.bookings = CKQuery()
//        Items.shared.sharedItems = CKQuery()
//        Activities.shared.activities = CKQuery()
        database.recuperaNote()
        return true
   }
    
    func application(_ application: UIApplication,didReceiveRemoteNotification userInfo: [AnyHashable : Any]){
        let notificationInfo = userInfo as! [String:NSObject]
        let notification = CKNotification(fromRemoteNotificationDictionary: notificationInfo)
        _ = notification.alertBody
        if let queryNotification = notification as? CKQueryNotification{
            _ = queryNotification.recordID
        }
        
    }
    

    // Handle remote notification registration.
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        // Forward the token to your provider, using a custom method.
    
    }
    
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // The token is not currently available.
        print("Remote notification support is unavailable due to error: \(error.localizedDescription)")
       
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
}

