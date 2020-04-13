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
        let viewModel = RegisterViewModel()
        viewModel.coordinator = self
        
        let registerVC = RegisterViewController(viewModel: viewModel)
        
        let topVC = window.rootViewController?.topViewController()
        topVC?.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension RegisterCoordinator: RegisterViewModelDelegate {
    
    func gotoMain() {
        let topVC = window.rootViewController?.topViewController()
        topVC?.navigationController?.popToRootViewController(animated: true)
    }
    
}
