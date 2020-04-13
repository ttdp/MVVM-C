//
//  MainViewModelTests.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 4/12/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import XCTest
@testable import MVVM_C

class MainViewModelTests: XCTestCase {
    
    var sut: MainViewModel!
    var dataModel: MainDataModelMock!
    var coordinator: MainCoordinatorMock!
    
    override func setUp() {
        dataModel = MainDataModelMock()
        coordinator = MainCoordinatorMock()
        sut = MainViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }
    
    func testInit() {
        XCTAssertEqual(sut.news, [])
    }
    
    func testloadNews() {
        sut.loadNews {}
        XCTAssert(dataModel.isFetchNewsCalled)
    }
    
    func testShowLogin() {
        sut.showLogin()
        XCTAssert(coordinator.isGotoLoginCalled)
    }
    
    func testShowRegister() {
        sut.showRegister()
        XCTAssert(coordinator.isGotoRegisterCalled)
    }
    
}
