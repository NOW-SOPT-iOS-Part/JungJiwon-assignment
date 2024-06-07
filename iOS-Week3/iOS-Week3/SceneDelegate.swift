//
//  SceneDelegate.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)

        let mainViewController = MainViewController()
        
        let tabBarController = TabBarViewController()
        tabBarController.viewControllers = [mainViewController]
        self.window?.rootViewController = tabBarController

        self.window?.makeKeyAndVisible()
    }
}
