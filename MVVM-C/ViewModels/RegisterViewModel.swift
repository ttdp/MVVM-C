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
    
    var validationError: String?
    
    init(dataModel: RegisterDataModelProtocol = RegisterDataModel()) {
        self.dataModel = dataModel
    }
    
    func register(email: String, username: String, password: String, confirm: String, completion: @escaping (Outcome) -> Void) {
        guard validate(email: email, username: username, password: password, confirm: confirm) else {
            completion(Outcome(error: validationError))
            return
        }
        
        dataModel.register(email: email, username: username, password: password) { outcome in
            DispatchQueue.main.async {
                if outcome.isSuccess {
                    UserDefaults.standard.set(true, forKey: Constant.isLoggedIn)
                    self.coordinator?.gotoMain()
                }
                
                completion(outcome)
            }
        }
    }
    
    func validate(email: String, username: String, password: String, confirm: String) -> Bool {
        // Email regular expression
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidEmail = emailPredicate.evaluate(with: email)
        
        guard isValidEmail else {
            validationError = "Invalid Email"
            return false
        }
        
        // Username regular expression: 4-20, no _ or . at beginning or end, start with letter
        let usernameRegEx = "^(?=.{4,20}$)(?![_.])[A-Za-z](?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
        let usernamePredicate = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        let isValidUsername = usernamePredicate.evaluate(with: username)
        
        guard isValidUsername else {
            validationError = "Invalid Username"
            return false
        }
        
        // Password
        let isValidPassword = password == confirm
        
        guard isValidPassword else {
            validationError = "Passwords Do Not Match"
            return false
        }
        
        validationError = nil
        return true
    }
    
}
