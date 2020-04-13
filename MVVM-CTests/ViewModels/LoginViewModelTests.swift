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
    var dataModel: LoginDataModelMock!
    var coordinator: LoginCoordinatorMock!
    
    override func setUp() {
        dataModel = LoginDataModelMock()
        coordinator = LoginCoordinatorMock()
        sut = LoginViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }
    
    func testInit() {
        XCTAssertNil(sut.validationError)
    }
    
    func testLogin() {
        let async = expectation(description: "async")
        
        sut.login(username: "user", password: "pwd") { _ in
            async.fulfill()
            XCTAssert(self.coordinator.isGotoMainCalled)
        }
        
        XCTAssert(dataModel.isLoginCalled)
        wait(for: [async], timeout: 1)
    }
    
    func testValide() {
        var isValid = sut.validate(username: "_abc")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Invalid Username")
        
        isValid = sut.validate(username: ".abcd")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Invalid Username")
        
        isValid = sut.validate(username: "0abc")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Invalid Username")
        
        isValid = sut.validate(username: "abcd")
        XCTAssert(isValid)
        XCTAssertEqual(sut.validationError, nil)
    }
    
    func testShowRegister() {
        sut.showRegister()
        XCTAssert(coordinator.isGotoRegisterCalled)
    }
    
}
