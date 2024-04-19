//
//  LoginViewController.swift
//  iOS-Week2
//
//  Created by  정지원 on 2024/04/19.
//

import Foundation
import UIKit
import SnapKit

extension UITextField {
    // 클리어 버튼을 설정하는 컴퓨티드 프로퍼티
    var clearButton: UIButton {
        if let button = value(forKey: "_clearButton") as? UIButton {
            return button
        } else {
            let button = UIButton(type: .custom)
            let image = UIImage(systemName: "xmark.circle.fill")
            button.setImage(image, for: .normal)
            button.tintColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            rightView = button
            rightViewMode = .whileEditing
            return button
        }
    }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TIVING ID 로그인"
        label.textColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        //대체텍스트 색상 변경
        textField.attributedPlaceholder = NSAttributedString(string: " 아이디", attributes: [
            .foregroundColor: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1),
            .font: UIFont(name: "Pretendard-SemiBold", size: 15)!
        ])
        textField.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
        textField.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 3
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: " 비밀번호", attributes: [
            .foregroundColor: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1),
            .font: UIFont(name: "Pretendard-SemiBold", size: 15)!
        ])
        textField.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
        textField.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        textField.clearButtonMode = .whileEditing

        textField.layer.cornerRadius = 3
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    //눈 모양 버튼
    private lazy var passwordVisibilityButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            button.tintColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
            button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            return button
        }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.isEnabled = false
        return button
    }()
    
    private lazy var findIDButton: UIButton = {
            let button = UIButton()
            button.setTitle("아이디 찾기", for: .normal)
            button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            button.addTarget(self, action: #selector(findIDButtonTapped), for: .touchUpInside)
            return button
        }()
        
    private lazy var divideLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private lazy var findPasswordButton: UIButton = {
            let button = UIButton()
            button.setTitle("비밀번호 찾기", for: .normal)
            button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            button.addTarget(self, action: #selector(findPasswordButtonTapped), for: .touchUpInside)
            return button
        }()
        
    private lazy var questLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private lazy var createNicknameButton: UIButton = {
            let button = UIButton()
            button.setTitle("닉네임 만들러 가기", for: .normal)
            button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
            button.addTarget(self, action: #selector(createNicknameButtonTapped), for: .touchUpInside)
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            loginButton.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
            loginButton.isEnabled = true
            idTextField.layer.borderWidth = 2
            idTextField.layer.borderColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1).cgColor
                    
            //passwordTextField의 border 속성 원래대로 복구
            passwordTextField.layer.borderWidth = 0
            
        } else if textField == passwordTextField {
            loginButton.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
            loginButton.isEnabled = true
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1).cgColor
                    
            //idTextField의 border 속성 원래대로 복구
            idTextField.layer.borderWidth = 0
                }
       }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(findIDButton)
        view.addSubview(divideLabel)
        view.addSubview(findPasswordButton)
        view.addSubview(questLabel)
        view.addSubview(createNicknameButton)
    }
    //snapkit 위치 조절
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(236)
            make.height.equalTo(44)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        passwordTextField.addSubview(passwordVisibilityButton)
            passwordTextField.addSubview(passwordTextField.clearButton)
            
            passwordVisibilityButton.snp.makeConstraints { make in
                make.centerY.equalTo(passwordTextField)
                make.trailing.equalTo(passwordTextField).offset(-30) // clearButtonMode와 겹치지 않도록 조절
                make.width.equalTo(30)
                make.height.equalTo(30)
            }
            
            passwordTextField.clearButton.snp.makeConstraints { make in
                make.centerY.equalTo(passwordTextField)
                make.trailing.equalTo(passwordTextField).offset(-15) // 눈 모양 버튼과 겹치지 않도록 조절
            }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        findIDButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.trailing.equalTo(view.snp.centerX).offset(-30)
        }
        
        divideLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(25)
            make.trailing.equalTo(view.snp.centerX).offset(0)
        }
        
        findPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(findIDButton) // 아이디 찾기 버튼과 동일한 세로 위치
            make.leading.equalTo(view.snp.centerX).offset(30)
        }
          
        questLabel.snp.makeConstraints { make in
            make.top.equalTo(findPasswordButton.snp.bottom).offset(50)
            //오른쪽 정렬
            make.trailing.equalTo(view.snp.centerX).offset(-15)
        }
        createNicknameButton.snp.makeConstraints { make in
            make.centerY.equalTo(questLabel)
            //오른쪽 정렬
            make.leading.equalTo(view.snp.centerX).offset(15)
        }
    }
    
    @objc func loginButtonDidTap() {
        presentToWelcomeVC()
    }
    @objc func findIDButtonTapped() {
            print("아이디 찾기 버튼이 눌렸습니다.")
        }
        
    @objc func findPasswordButtonTapped() {
            print("비밀번호 찾기 버튼이 눌렸습니다.")
        }
        
    @objc func createNicknameButtonTapped() {
            print("닉네임 만들러 가기 버튼이 눌렸습니다.")
        }
    
    @objc func togglePasswordVisibility() {
        // 현재 보이는 비밀번호 상태를 토글
        passwordTextField.isSecureTextEntry.toggle()

        // 비밀번호 표시 여부에 따라 이미지 설정
        if passwordTextField.isSecureTextEntry {
            passwordVisibilityButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordVisibilityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
}
