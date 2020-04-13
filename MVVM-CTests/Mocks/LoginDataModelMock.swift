//
//  LoginDataModelMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class LoginDataModelMock: LoginDataModelProtocol {
    
    var isLoginCalled = false
    
    func login(username: String, password: String, completion: @escaping (Outcome) -> Void) {
        isLoginCalled = true
        completion(.success)
    }
    
}
