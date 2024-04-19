//
//  WelcomeViewController.swift
//  iOS-Week2
//
//  Created by  정지원 on 2024/04/19.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tiving")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        // 줄 간격 설정
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
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()
    
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
      [imageView, welcomeLabel, mainButton].forEach{self.view.addSubview($0)}
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.width.equalTo(375)
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(40)
            $0.width.equalTo(250)
            $0.height.equalTo(80)
        }
        
        mainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        bindID()
    }
    
    private func bindID() {
//        guard let idText = id else { return }
        
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            print("id값이 존재하지 않습니다.")
        }
    
    }
}
