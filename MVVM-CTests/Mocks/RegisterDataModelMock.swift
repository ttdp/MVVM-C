//
//  RegisterDataModelMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class RegisterDataModelMock: RegisterDataModelProtocol {
    
    var isRegisterCalled = false
    
    func register(email: String, username: String, password: String, completion: (Outcome) -> Void) {
        isRegisterCalled = true
        completion(.success)
    }
    
}
