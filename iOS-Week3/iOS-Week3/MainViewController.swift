//
//  MainViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        // 이 부분에 TabBarViewController를 추가합니다.
        let tabBarVC = TabBarViewController()
        addChild(tabBarVC)
        view.addSubview(tabBarVC.view)
        tabBarVC.didMove(toParent: self)
        
        // Optional: TabBarViewController의 오토레이아웃 설정
        tabBarVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBarVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 나머지 MainViewController 코드...
}

