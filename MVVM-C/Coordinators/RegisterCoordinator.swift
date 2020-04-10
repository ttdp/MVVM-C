//
//  RegisterCoordinator.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class RegisterCoordinator: AppCoordinator {

    override func start() {
        let registerVM = RegisterViewModel()
        registerVM.coordinator = self
        
        let registerVC = RegisterViewController(viewModel: registerVM)
        
        guard let topVC = window.rootViewController?.topViewController() else {
            return
        }
        
        topVC.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension RegisterCoordinator: RegisterViewModelDelegate {
    
    func gotoSignUp() {
        
    }
    
}
