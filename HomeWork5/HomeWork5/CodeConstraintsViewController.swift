//
//  ViewController2.swift
//  HomeWork5
//
//  Created by Vika on 06.03.2024.
//

import UIKit

class CodeConstraintsViewController: UIViewController {
    private let emailTextFieldView = AppTextFieldView(title: "Пошта:")
    private let passwordTextFieldView = AppTextFieldView(title: "Пароль:")
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Увійти", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Реєстрація", for: .normal)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton,registerButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(textFieldStackView)
        view.addSubview(buttonStackView)
        
        let isPhone = traitCollection.userInterfaceIdiom == .phone
        let textFieldStackViewWidthConstant: CGFloat = isPhone ? 311 : 800
        let buttonStackViewWidthConstant: CGFloat = isPhone ? 150 : 200
        
        NSLayoutConstraint.activate([
            textFieldStackView.centerYAnchor.constraint(
                equalToSystemSpacingBelow: view.centerYAnchor,
                multiplier: 1.05
            ),
            
            textFieldStackView.widthAnchor.constraint(equalToConstant: textFieldStackViewWidthConstant),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor,constant: 30),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalToConstant: buttonStackViewWidthConstant),
        ])
    }
}
