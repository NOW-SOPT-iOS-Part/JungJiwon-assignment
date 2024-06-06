//
//  MainViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

final class MainViewController: UIViewController {
    
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        view.backgroundColor = .black

    }
    
}

extension MainViewController {
    func configureTabBar() {
        let tabBarController = UITabBarController()
        tabBarController.configureTabBar()
        
        // Present the tab bar controller
        present(tabBarController, animated: false, completion: nil)
    }
}
