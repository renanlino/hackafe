//
//  AppDelegate.swift
//  Projeto-Ferias-Quadro-Fotos-Iluminado-iOS
//
//  Created by Humberto Vieira de Castro on 6/27/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        registerNotificationTypes()

        
        //var settings : UIUserNotificationSettings = UIUserNotificationSettings(forTypes:UIUserNotificationType.Alert|UIUserNotificationType.Sound, categories: nil)
        //UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        //UIApplication.sharedApplication().registerForRemoteNotifications()
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func registerNotificationTypes() {
        let types: UIUserNotificationType = [.Badge, .Sound, .Alert] 
        
        let one = UIMutableUserNotificationAction()
        one.identifier = "one"
        one.title = "One"
        one.activationMode = .Foreground
        one.destructive = false
        one.authenticationRequired = false
        
        let two = UIMutableUserNotificationAction()
        two.identifier = "two"
        two.title = "Two"
        two.activationMode = .Foreground
        two.destructive = false
        two.authenticationRequired = false
        
        let three = UIMutableUserNotificationAction()
        three.identifier = "three"
        three.title = "Three"
        three.activationMode = .Foreground
        three.destructive = false
        three.authenticationRequired = false
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = "SAMPLE_CATEGORY"
        category.setActions([one, two, three], forContext: .Default)
        category.setActions([two, three], forContext: .Minimal)
        
        let categories = NSSet(object: category)
        
        let settings = UIUserNotificationSettings(forTypes: types, categories: categories as? Set<UIUserNotificationCategory>)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        print("Received local notification")
    }
    
    func application(application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forLocalNotification notification: UILocalNotification,
        completionHandler: () -> Void)
    {
        print("Handle action \(identifier)")
        completionHandler()
    }
}

