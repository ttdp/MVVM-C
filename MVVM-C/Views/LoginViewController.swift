//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class LoginViewController: ViewModelController<LoginViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registerButton = UIBarButtonItem(title: Constant.register, style: .plain, target: self, action: #selector(handleRegister))
        navigationItem.rightBarButtonItem = registerButton
        
        view.backgroundColor = .white
    }
    
    // MARK: - View
    
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
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constant.signIn, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        view.addSubview(usernameLabel)
        view.addConstraints(format: "H:[v0]", views: usernameLabel)
        view.addConstraints(format: "V:[v0]", views: usernameLabel)
        usernameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        view.addSubview(usernameField)
        view.addConstraints(format: "H:[v0(180)]", views: usernameField)
        view.addConstraints(format: "V:[v0(40)]", views: usernameField)
        usernameField.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 10).isActive = true
        usernameField.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor).isActive = true
        
        view.addSubview(passwordLabel)
        view.addConstraints(format: "H:[v0]", views: passwordLabel)
        view.addConstraints(format: "V:[v0]", views: passwordLabel)
        passwordLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        view.addSubview(passwordField)
        view.addConstraints(format: "H:[v0(180)]", views: passwordField)
        view.addConstraints(format: "V:[v0(40)]", views: passwordField)
        passwordField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 10).isActive = true
        passwordField.centerYAnchor.constraint(equalTo: passwordLabel.centerYAnchor).isActive = true
        
        view.addSubview(signInButton)
        view.addConstraints(format: "H:[v0(100)]", views: signInButton)
        view.addConstraints(format: "V:[v0(40)]", views: signInButton)
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    // MARK: - Action
    
    @objc func handleRegister() {
        viewModel.showRegister()
    }
    
    @objc func handleSignIn() {
        guard
            let username = usernameField.text, !username.isEmpty,
            let password = passwordField.text, !password.isEmpty
            else {
                print("Please fill in all fields")
                return
        }
        
        viewModel.login(username: username, password: password) { outcome in
            if let error = outcome.errorInfo {
                print(error)
            }
        }
    }
    
}
