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
        let loginVM = LoginViewModel()
        loginVM.coordinator = self
        
        let loginVC = LoginViewController(viewModel: loginVM)
        
        guard let topVC = window.rootViewController?.topViewController() else {
            return
        }
        
        topVC.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension LoginCoordinator: LoginViewModelDelegate {
    
    func gotoRegister() {
        RegisterCoordinator(window: window).start()
    }
    
}
