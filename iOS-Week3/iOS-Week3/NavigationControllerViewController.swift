//
//  NavigationControllerViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

extension UINavigationController {
    func addNavigationItems() {
        // 네비게이션 바의 로고 이미지 설정
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        
        // 네비게이션 바 아이템 설정
        let homeBarButtonItem = UIBarButtonItem(title: "홈", style: .plain, target: nil, action: nil)
        let liveBarButtonItem = UIBarButtonItem(title: "실시간", style: .plain, target: nil, action: nil)
        let tvProgramBarButtonItem = UIBarButtonItem(title: "TV프로그램", style: .plain, target: nil, action: nil)
        let movieBarButtonItem = UIBarButtonItem(title: "영화", style: .plain, target: nil, action: nil)
        let paramountPlusBarButtonItem = UIBarButtonItem(title: "파라마운트+", style: .plain, target: nil, action: nil)
        
        // 네비게이션 바 아이템 추가
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.rightBarButtonItems = [paramountPlusBarButtonItem, movieBarButtonItem, tvProgramBarButtonItem, liveBarButtonItem, homeBarButtonItem]
    }
}
