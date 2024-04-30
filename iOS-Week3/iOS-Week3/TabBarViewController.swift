//
//  TabBarViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = LoginViewController()
        let releaseVC = LoginViewController()
        let searchVC = LoginViewController()
        let recordVC = LoginViewController()

        homeVC.title = "홈"
        releaseVC.title = "공개예정"
        searchVC.title = "검색"
        recordVC.title = "기록"
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        releaseVC.tabBarItem.image = UIImage(systemName: "video")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        recordVC.tabBarItem.image = UIImage(systemName: "clock")
        
        // 위에 타이틀 text를 항상 크게 보이게 설정
        homeVC.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        releaseVC.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        searchVC.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        recordVC.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
        
        // navigationController의 root view 설정
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationRelease = UINavigationController(rootViewController: releaseVC)
        let navigationSearch = UINavigationController(rootViewController: searchVC)
        let navigationLibrary = UINavigationController(rootViewController: recordVC)
        
        navigationHome.navigationBar.prefersLargeTitles = true
        navigationRelease.navigationBar.prefersLargeTitles = true
        navigationSearch.navigationBar.prefersLargeTitles = true
        navigationLibrary.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationHome, navigationRelease, navigationSearch, navigationLibrary], animated: false)
    }
    
    let HEIGHT_TAB_BAR: CGFloat = 100
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = tabBar.frame
        tabFrame.size.height = HEIGHT_TAB_BAR
        tabFrame.origin.y = view.frame.size.height - HEIGHT_TAB_BAR
        tabBar.frame = tabFrame
    }
}
