//
//  MainViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let popularSeriesViewController = PopularSeriesViewController()
    private let asiaContentAwardsViewController = AsiaContentAwardsViewController()
    
    private let yourname: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yourname")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let popularLabel: UILabel = {
        let label = UILabel()
        label.text = "1화 무료! 파라마운트+ 인기 시리즈"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        return label
    }()
    
    let awardsLabel: UILabel = {
        let label = UILabel()
        label.text = "아시아콘텐츠어워즈 수상작 & 후보작"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        return label
    }()
    
    private lazy var bears: UIImageView = {
        let image = UIImage(named: "bears")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(yourname)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(popularSeriesViewController.view)
        scrollView.addSubview(bears)
        scrollView.addSubview(awardsLabel)
        scrollView.addSubview(asiaContentAwardsViewController.view)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        yourname.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(yourname.snp.width).multipliedBy(yourname.image!.size.height / yourname.image!.size.width) //비율에 맞게
        }
        popularLabel.snp.makeConstraints {
            $0.top.equalTo(yourname.snp.bottom).offset(44)
            $0.leading.equalToSuperview().inset(20)
        }
        popularSeriesViewController.view.snp.makeConstraints {
            $0.top.equalTo(popularLabel.snp.bottom)
            $0.height.equalTo(200)
            $0.leading.trailing.equalToSuperview()
        }
        bears.snp.makeConstraints {
            $0.top.equalTo(popularSeriesViewController.view.snp.bottom).offset(49)
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview()
        }
        awardsLabel.snp.makeConstraints {
            $0.top.equalTo(bears.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        asiaContentAwardsViewController.view.snp.makeConstraints {
            $0.top.equalTo(awardsLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
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
