//
//  LoginViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//


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

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        setDelegate()
        setButtonAction()
    }
    
    func setDelegate() {
        loginView.idTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    func setButtonAction() {
        loginView.passwordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        loginView.findPasswordButton.addTarget(self, action: #selector(findPasswordButtonTapped), for: .touchUpInside)
        loginView.createNicknameButton.addTarget(self, action: #selector(createNicknameButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonDidTap() {
        pushToWelcomeVC()
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
        loginView.passwordTextField.isSecureTextEntry.toggle()
        loginView.passwordVisibilityButton.isSelected.toggle()

        // 비밀번호 표시 여부에 따라 이미지 설정
        if loginView.passwordTextField.isSecureTextEntry {
            loginView.passwordVisibilityButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            loginView.passwordVisibilityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.setLabelText(id: loginView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == loginView.idTextField {
            loginView.loginButton.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
            loginView.loginButton.isEnabled = true
            loginView.idTextField.layer.borderWidth = 2
            loginView.idTextField.layer.borderColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1).cgColor
            loginView.passwordTextField.layer.borderWidth = 0
            
        } else if textField == loginView.passwordTextField {
            loginView.loginButton.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 60/255, alpha: 1)
            loginView.loginButton.isEnabled = true
            loginView.passwordTextField.layer.borderWidth = 2
            loginView.passwordTextField.layer.borderColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1).cgColor
            loginView.idTextField.layer.borderWidth = 0
                }
       }
}

