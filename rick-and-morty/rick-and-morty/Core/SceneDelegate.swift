//
//  SceneDelegate.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import UIKit

// Conform to the UIWindowSceneDelegate protocol for handling scene-related events.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // Optional property to hold the main window of the app.

    // This method is called when the scene is about to connect to the session.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Safely cast the incoming scene to UIWindowScene.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Initialize the main window with the window scene.
        window = UIWindow(windowScene: windowScene)
        
        // Make the window key and visible, so it appears on the screen.
        window?.makeKeyAndVisible()
        
        // Set the root view controller of the window to a UINavigationController,
        // which manages a stack of view controllers. The initial view controller is CharactersListViewController.
        window?.rootViewController = UINavigationController(rootViewController: CharactersListViewController())
    }
    
}
