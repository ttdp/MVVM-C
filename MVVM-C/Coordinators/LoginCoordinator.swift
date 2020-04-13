//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class LoginCoordinator: AppCoordinator {
    
    override func start() {
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        
        let loginVC = LoginViewController(viewModel: viewModel)
        
        let topVC = window.rootViewController?.topViewController()
        topVC?.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension LoginCoordinator: LoginViewModelDelegate {
    
    func gotoRegister() {
        RegisterCoordinator(window: window).start()
    }
    
    func gotoMain() {
        let topVC = window.rootViewController?.topViewController()
        topVC?.navigationController?.popViewController(animated: true)
    }
    
}
