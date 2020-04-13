//
//  RegisterViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class RegisterViewController: ViewModelController<RegisterViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    // MARK: - View
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        return label
    }()
    
    let emailField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        return field
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username:"
        return label
    }()
    
    let usernameField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        return field
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        return label
    }()
    
    let passwordField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        return field
    }()
    
    let confirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password:"
        return label
    }()
    
    let confirmField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constant.signUp, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        view.addSubview(emailLabel)
        view.addConstraints(format: "H:[v0]", views: emailLabel)
        view.addConstraints(format: "V:[v0]", views: emailLabel)
        emailLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -220).isActive = true
        
        view.addSubview(emailField)
        view.addConstraints(format: "H:[v0(160)]", views: emailField)
        view.addConstraints(format: "V:[v0(40)]", views: emailField)
        emailField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 10).isActive = true
        emailField.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor).isActive = true
        
        view.addSubview(usernameLabel)
        view.addConstraints(format: "H:[v0]", views: usernameLabel)
        view.addConstraints(format: "V:[v0]", views: usernameLabel)
        usernameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160).isActive = true
        
        view.addSubview(usernameField)
        view.addConstraints(format: "H:[v0(160)]", views: usernameField)
        view.addConstraints(format: "V:[v0(40)]", views: usernameField)
        usernameField.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 10).isActive = true
        usernameField.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor).isActive = true
        
        view.addSubview(passwordLabel)
        view.addConstraints(format: "H:[v0]", views: passwordLabel)
        view.addConstraints(format: "V:[v0]", views: passwordLabel)
        passwordLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        view.addSubview(passwordField)
        view.addConstraints(format: "H:[v0(160)]", views: passwordField)
        view.addConstraints(format: "V:[v0(40)]", views: passwordField)
        passwordField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 10).isActive = true
        passwordField.centerYAnchor.constraint(equalTo: passwordLabel.centerYAnchor).isActive = true
        
        view.addSubview(confirmLabel)
        view.addConstraints(format: "H:[v0]", views: confirmLabel)
        view.addConstraints(format: "V:[v0]", views: confirmLabel)
        confirmLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        confirmLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        view.addSubview(confirmField)
        view.addConstraints(format: "H:[v0(160)]", views: confirmField)
        view.addConstraints(format: "V:[v0(40)]", views: confirmField)
        confirmField.leadingAnchor.constraint(equalTo: confirmLabel.trailingAnchor, constant: 10).isActive = true
        confirmField.centerYAnchor.constraint(equalTo: confirmLabel.centerYAnchor).isActive = true
        
        view.addSubview(signUpButton)
        view.addConstraints(format: "H:[v0(100)]", views: signUpButton)
        view.addConstraints(format: "V:[v0(40)]", views: signUpButton)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    // MARK: - Action
    
    @objc func handleSignUp() {
        viewModel.signUp()
    }
    
}
