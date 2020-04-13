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
    
    var validationError: String?
    
    init(dataModel: LoginDataModelProtocol = LoginDataModel()) {
        self.dataModel = dataModel
    }
    
    func login(username: String, password: String, completion: @escaping (Outcome) -> Void) {
        guard validate(username: username) else {
            completion(Outcome(error: validationError))
            return
        }
        
        dataModel.login(username: username, password: password) { outcome in
            DispatchQueue.main.async {
                if outcome.isSuccess {
                    UserDefaults.standard.set(true, forKey: Constant.isLoggedIn)
                    self.coordinator?.gotoMain()
                }
                
                completion(outcome)
            }
        }
    }
    
    func validate(username: String) -> Bool {
        // Username regular expression: 4-20, no _ or . at beginning or end, start with letter
        let usernameRegEx = "^(?=.{4,20}$)(?![_.])[A-Za-z](?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
        let usernamePredicate = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        let isValidUsername = usernamePredicate.evaluate(with: username)
        
        guard isValidUsername else {
            validationError = "Invalid Username"
            return false
        }
        
        validationError = nil
        return true
    }
    
    func showRegister() {
        coordinator?.gotoRegister()
    }
    
}
