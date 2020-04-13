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
    func gotoMain()
}

class LoginViewModel: ViewModelProtocol {

    var coordinator: LoginViewModelDelegate?
    
    let dataModel: LoginDataModelProtocol
    
    init(dataModel: LoginDataModelProtocol = LoginDataModel()) {
        self.dataModel = dataModel
    }
    
    func login() {
        dataModel.login(username: "", password: "") { success in
            if success {
                UserDefaults.standard.set(success, forKey: Constant.isLoggedIn)
                DispatchQueue.main.async {
                    self.coordinator?.gotoMain()
                }
            }
        }
    }
    
    func showRegister() {
        coordinator?.gotoRegister()
    }
    
}
