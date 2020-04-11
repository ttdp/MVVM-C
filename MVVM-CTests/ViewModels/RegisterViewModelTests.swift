//
//  RegisterViewModelTests.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 4/12/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import XCTest
@testable import MVVM_C

class RegisterViewModelTests: XCTestCase {
    
    var sut: RegisterViewModel!
    
    override func setUp() {
        sut = RegisterViewModel()
    }
    
    func testInit() {
        XCTAssertNotNil(sut)
    }
    
}
