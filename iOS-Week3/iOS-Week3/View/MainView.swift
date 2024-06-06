//
//  MainView.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/4/24.
//

import UIKit

import SnapKit

final class MainView: UIView {
    
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
    
    private var bears: UIImageView = {
        let image = UIImage(named: "bears")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setaddSubview()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    func setaddSubview() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(yourname)
        scrollView.addSubview(popularLabel)
        scrollView.addSubview(popularSeriesViewController.view)
        scrollView.addSubview(bears)
        scrollView.addSubview(awardsLabel)
        scrollView.addSubview(asiaContentAwardsViewController.view)
    }
    
    func setupLayout() {
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
