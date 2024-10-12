//
//  AppDelegate.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

// Entry point for the application, conforming to UIApplicationDelegate protocol.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // This method is called when the app has completed its launch process.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Perform any final initialization before the app becomes active.
        return true // Indicates successful launch.
    }

    // MARK: - UISceneSession Lifecycle
    
    // This method is called when a new scene session is being created.
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Return a configuration object that specifies how the scene should be created.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
