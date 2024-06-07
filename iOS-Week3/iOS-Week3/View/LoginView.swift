//
//  LoginView.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/3/24.
//

import UIKit

import SnapKit

final class LoginView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TIVING ID 로그인"
        label.textColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    var idTextField: UITextField = {
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
        // textField.delegate = self
        return textField
    }()
    
    var passwordTextField: UITextField = {
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
        //     textField.delegate = self
        return textField
    }()
    
    //눈 모양 버튼
    var passwordVisibilityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        return button
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.isEnabled = false
        return button
    }()
    
    var findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        //   button.addTarget(self, action: #selector(findIDButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var divideLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    var findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()
    
    var questLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    var createNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러 가기", for: .normal)
        button.setTitleColor(UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        return button
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

extension LoginView {
    func setaddSubview() {
        backgroundColor = .black
        addSubview(titleLabel)
        addSubview(idTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(findIDButton)
        addSubview(divideLabel)
        addSubview(findPasswordButton)
        addSubview(questLabel)
        addSubview(createNicknameButton)
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
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
            make.trailing.equalTo(snp.centerX).offset(-30)
        }
        
        divideLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(25)
            make.trailing.equalTo(snp.centerX).offset(0)
        }
        
        findPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(findIDButton) // 아이디 찾기 버튼과 동일한 세로 위치
            make.leading.equalTo(snp.centerX).offset(30)
        }
        
        questLabel.snp.makeConstraints { make in
            make.top.equalTo(findPasswordButton.snp.bottom).offset(50)
            //오른쪽 정렬
            make.trailing.equalTo(snp.centerX).offset(-15)
        }
        createNicknameButton.snp.makeConstraints { make in
            make.centerY.equalTo(questLabel)
            //오른쪽 정렬
            make.leading.equalTo(snp.centerX).offset(15)
        }
    }
}

