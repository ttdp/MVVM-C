//
//  RegisterViewModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol RegisterViewModelDelegate {
    func gotoMain()
}

class RegisterViewModel: ViewModelProtocol {
    
    var coordinator: RegisterViewModelDelegate?
    
    let dataModel: RegisterDataModelProtocol
    
    init(dataModel: RegisterDataModelProtocol = RegisterDataModel()) {
        self.dataModel = dataModel
    }
    
    func signUp() {
        dataModel.register(email: "", username: "", password: "") { success in
            if success {
                UserDefaults.standard.set(success, forKey: Constant.isLoggedIn)
                DispatchQueue.main.async {
                    self.coordinator?.gotoMain()
                }
            }
        }
    }
    
}
