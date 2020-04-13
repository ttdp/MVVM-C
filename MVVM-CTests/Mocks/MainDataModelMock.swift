//
//  MainDataModelMock.swift
//  MVVM-CTests
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
@testable import MVVM_C

class MainDataModelMock: MainDataModelProtocol {
    
    var isFetchNewsCalled = false
    
    func fetchNews(completion: @escaping ([String]) -> Void) {
        isFetchNewsCalled = true
    }
    
}
