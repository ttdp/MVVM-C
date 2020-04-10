//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class LoginViewController: ViewModelController<LoginViewModel> {
    
    // MARK: - Property

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleSignUp))
        navigationItem.rightBarButtonItem = addButton
        
        view.backgroundColor = .white
    }
    
    // MARK: - Action
    
    @objc func handleSignUp() {
        viewModel.showRegister()
    }
    
}
