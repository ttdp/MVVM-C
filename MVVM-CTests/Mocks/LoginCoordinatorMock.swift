//
//  LoginCoordinatorMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class LoginCoordinatorMock: LoginViewModelDelegate {
    
    var isGotoRegisterCalled = false
    var isGotoMainCalled = false
    
    func gotoRegister() {
        isGotoRegisterCalled = true
    }
    
    func gotoMain() {
        isGotoMainCalled = true
    }
    
}
