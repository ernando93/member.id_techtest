//
//  SceneDelegate.swift
//  technicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit
import SwiftUI
import IQKeyboardManagerSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        setMainWindow()
        configKeyboard()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

//MARK: - Setup Main Window
extension SceneDelegate {
    
    func setMainWindow() {
        
        if User.currentUser != nil {
            
            self.showHomePage()
        } else {
            
            self.showLoginPage()
        }
    }
    
    func showLoginPage() {
        
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    func showHomePage() {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

// MARK: - Keyboard Setting
extension SceneDelegate {
    
    func configKeyboard() {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
