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
        let mainVM = MainViewModel()
        mainVM.coordinator = self
        
        let mainVC = MainViewController(viewModel: mainVM)
        
        window.rootViewController = UINavigationController(rootViewController: mainVC)
        window.makeKeyAndVisible()
    }
    
}

extension MainCoordinator: MainViewModelDelegate {
    
    func gotoLogin() {
        LoginCoordinator(window: window).start()
    }
    
}
