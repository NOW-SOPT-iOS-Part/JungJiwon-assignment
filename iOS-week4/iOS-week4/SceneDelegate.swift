//
//  SceneDelegate.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(windowScene: windowScene)

        let boxOfficeViewController = BoxOfficeViewController()
        let navigationController = UINavigationController(rootViewController: boxOfficeViewController)
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
    }
}
