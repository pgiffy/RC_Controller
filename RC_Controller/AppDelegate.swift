//
//  AppDelegate.swift
//  For RC Car Controller
//  Created by Peter Gifford on 5/10/18.
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

        // Method to pause tasks if needed
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       // no use for this method because there is no background functionality needed
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
            //unneeded since there is no background functionality
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //not used because the app has simple design flow no moving in and out
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // no saved data from one run to the enxt so this is un used
    }


}

