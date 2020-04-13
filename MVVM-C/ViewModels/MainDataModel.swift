//
//  MainDataModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol MainDataModelProtocol {
    func fetchNews(completion: @escaping ([String]) -> Void)
}

class MainDataModel: MainDataModelProtocol {
    
    func fetchNews(completion: @escaping ([String]) -> Void) {
        // Network request goes here
    }
    
}
