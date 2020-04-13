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
    var dataModel: RegisterDataModelMock!
    var coordinator: RegisterCoordinatorMock!
    
    override func setUp() {
        dataModel = RegisterDataModelMock()
        coordinator = RegisterCoordinatorMock()
        sut = RegisterViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }
    
    func testInit() {
        XCTAssertNil(sut.validationError)
    }
    
    func testRegister() {
        let async = expectation(description: "async")
        
        sut.register(email: "user@email.com", username: "user", password: "pwd", confirm: "pwd") { _ in
            async.fulfill()
            XCTAssert(self.coordinator.isGotoMainCalled)
        }
        
        XCTAssert(dataModel.isRegisterCalled)
        wait(for: [async], timeout: 1)
    }
    
    func testValidate() {
        var isValid = sut.validate(email: "e", username: "", password: "", confirm: "")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Invalid Email")
        
        isValid = sut.validate(email: "e@email.com", username: "_ab", password: "", confirm: "")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Invalid Username")
        
        isValid = sut.validate(email: "e@email.com", username: "abcd", password: "pwd", confirm: "password")
        XCTAssertFalse(isValid)
        XCTAssertEqual(sut.validationError, "Passwords Do Not Match")
        
        isValid = sut.validate(email: "e@email.com", username: "abcd", password: "pwd", confirm: "pwd")
        XCTAssert(isValid)
        XCTAssertEqual(sut.validationError, nil)
    }
    
}
