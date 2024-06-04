//
//  WelcomeViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//


import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func welcomeViewController(_ controller: WelcomeViewController, didFinishWithID id: String?)
}

final class WelcomeViewController: UIViewController {
    var welcomeView = WelcomeView()
    
    override func loadView() {
        view = welcomeView
    }
    
    var id: String?
    weak var delegate: WelcomeViewControllerDelegate?
    
    @objc private func backToLoginButtonDidTap() {
        let mainVC = MainViewController()
            navigationController?.pushViewController(mainVC, animated: true)
    }
    
    private func bindID() {
        if let idText = id {
            welcomeView.welcomeLabel.text = "\(idText)님 \n반가워요!"
            delegate?.welcomeViewController(self, didFinishWithID: idText)
        } else {
            print("id값이 존재하지 않습니다.")
        }
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        bindID()
        loadView()
        setButtonAction()
    }
    
    func setButtonAction() {
        welcomeView.mainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
}

