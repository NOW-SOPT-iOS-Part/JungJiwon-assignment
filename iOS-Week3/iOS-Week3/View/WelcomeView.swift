//
//  WelcomeView.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/3/24.
//
import UIKit

import SnapKit

final class WelcomeView: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tiving")
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        label.attributedText = attributedText
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        return label
    }()
    
    var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()
}

extension WelcomeView {
    func setaddSubview() {
        addSubview(imageView)
        addSubview(welcomeLabel)
        addSubview(mainButton)
    }
    
    func setupLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.width.equalTo(375)
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(40)
            $0.width.equalTo(350)
            $0.height.equalTo(80)
        }
        
        mainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-60)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
}
