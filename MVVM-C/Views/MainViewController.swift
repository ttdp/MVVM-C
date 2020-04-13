//
//  MainViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class MainViewController: ViewModelController<MainViewModel> {
    
    lazy var loginButton: UIBarButtonItem = {
        return UIBarButtonItem(title: Constant.login, style: .plain, target: self, action: #selector(handleLogin))
    }()
    lazy var logoutButton: UIBarButtonItem = {
        return UIBarButtonItem(title: Constant.logout, style: .plain, target: self, action: #selector(handleLogout))
    }()
    
    lazy var registerButton: UIBarButtonItem = {
        return UIBarButtonItem(title: Constant.register, style: .plain, target: self, action: #selector(handleRegister))
    }()
    
    var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: Constant.isLoggedIn)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadNews {
            // Refresh news feed
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isLoggedIn {
            navigationItem.leftBarButtonItem = logoutButton
            navigationItem.rightBarButtonItem = nil
        } else {
            navigationItem.leftBarButtonItem = loginButton
            navigationItem.rightBarButtonItem = registerButton
        }
    }
    
    // MARK: - View
    
    let feedView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let newsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "News Feed"
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        view.addSubview(feedView)
        view.addConstraints(format: "H:|-20-[v0]-20-|", views: feedView)
        view.addConstraints(format: "V:|-(\(naviGap + 20))-[v0]-(\(bottomGap + 20))-|", views: feedView)
        
        feedView.addSubview(newsLabel)
        feedView.addConstraints(format: "H:|[v0]|", views: newsLabel)
        feedView.addConstraints(format: "V:|[v0]|", views: newsLabel)
    }
    
    // MARK: - Action
    
    @objc func handleLogin() {
        viewModel.showLogin()
    }
    
    @objc func handleRegister() {
        viewModel.showRegister()
    }
    
    @objc func handleLogout() {
        viewModel.logout()
        
        navigationItem.leftBarButtonItem = loginButton
        navigationItem.rightBarButtonItem = registerButton
    }
    
}
