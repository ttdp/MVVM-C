//
//  LoginViewModelTests.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 4/12/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import XCTest
@testable import MVVM_C

class LoginViewModelTests: XCTestCase {
    
    var sut: LoginViewModel!
    
    override func setUp() {
        sut = LoginViewModel()
    }
    
    func testInit() {
        XCTAssertNotNil(sut)
    }
    
}
