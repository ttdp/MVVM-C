//
//  MainViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class MainViewController: ViewModelController<MainViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let signInButton = UIBarButtonItem(title: "Sign in", style: .plain, target: self, action: #selector(handleSignIn))
        navigationItem.leftBarButtonItem = signInButton
        
        let signUpButton = UIBarButtonItem(title: "Sign up", style: .plain, target: self, action: #selector(handleSignUp))
        navigationItem.rightBarButtonItem = signUpButton
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
    
    @objc func handleSignIn() {
        viewModel.showSignIn()
    }
    
    @objc func handleSignUp() {
        viewModel.showSignUp()
    }
    
}
