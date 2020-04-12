//
//  MainViewModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func gotoLogin()
    func gotoRegister()
}

class MainViewModel: ViewModelProtocol {
    
    var coordinator: MainViewModelDelegate?
    
    func showSignIn() {
        coordinator?.gotoLogin()
    }
    
    func showSignUp() {
        coordinator?.gotoRegister()
    }
    
}
