//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class MainCoordinator: AppCoordinator {
    
    override func start() {
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        
        let mainVC = MainViewController(viewModel: viewModel)
        
        window.rootViewController = UINavigationController(rootViewController: mainVC)
        window.makeKeyAndVisible()
    }
    
}

extension MainCoordinator: MainViewModelDelegate {
    
    func gotoLogin() {
        LoginCoordinator(window: window).start()
    }
    
    func gotoRegister() {
        RegisterCoordinator(window: window).start()
    }
    
}
