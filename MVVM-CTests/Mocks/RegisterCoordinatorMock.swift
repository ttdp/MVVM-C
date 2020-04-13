//
//  RegisterCoordinatorMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class RegisterCoordinatorMock: RegisterViewModelDelegate {
    
    var isGotoMainCalled = false
    
    func gotoMain() {
        isGotoMainCalled = true
    }
    
}
