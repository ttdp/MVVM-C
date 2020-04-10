//
//  RegisterViewModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol RegisterViewModelDelegate {
    func gotoSignUp()
}

class RegisterViewModel: ViewModelProtocol {
    
    var coordinator: RegisterViewModelDelegate?
    
    func signUp() {
        coordinator?.gotoSignUp()
    }
    
}
