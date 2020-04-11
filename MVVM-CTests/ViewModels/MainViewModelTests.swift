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
    
    override func setUp() {
        sut = MainViewModel()
    }
    
    func testInit() {
        XCTAssertNotNil(sut)
    }
    
}
