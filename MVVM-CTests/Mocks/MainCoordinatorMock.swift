//
//  MainCoordinatorMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class MainCoordinatorMock: MainViewModelDelegate {
    
    var isGotoLoginCalled = false
    var isGotoRegisterCalled = false
    
    func gotoLogin() {
        isGotoLoginCalled = true
    }
    
    func gotoRegister() {
        isGotoRegisterCalled = true
    }
    
}
