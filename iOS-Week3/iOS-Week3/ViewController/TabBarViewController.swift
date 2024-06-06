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
        configureTabBar()
    }
    
    func configureTabBar() {
        let homeVC = MainViewController()
        let releaseVC = ReleaseViewController()
        let searchVC = SearchViewController()
        let recordVC = RecordViewController()

        homeVC.title = "홈"
        releaseVC.title = "공개예정"
        searchVC.title = "검색"
        recordVC.title = "기록"
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        releaseVC.tabBarItem.image = UIImage(systemName: "video")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        recordVC.tabBarItem.image = UIImage(systemName: "clock")
        
        // 위에 타이틀 text를 항상 크게 보이게 설정
        homeVC.navigationItem.largeTitleDisplayMode = .always
        releaseVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        recordVC.navigationItem.largeTitleDisplayMode = .always
        
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
}
