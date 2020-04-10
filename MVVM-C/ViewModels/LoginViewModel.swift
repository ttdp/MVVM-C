//
//  LoginViewModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func gotoRegister()
}

class LoginViewModel: ViewModelProtocol {

    var coordinator: LoginViewModelDelegate?
    
    func showRegister() {
        coordinator?.gotoRegister()
    }
    
}
