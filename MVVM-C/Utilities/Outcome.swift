//
//  Outcome.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/13.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

struct Outcome {
    let isSuccess: Bool
    let errorInfo: String?
}

extension Outcome {

    static var success: Outcome {
        return Outcome(isSuccess: true, errorInfo: nil)
    }
    
    init(error: String?) {
        self.isSuccess = false
        self.errorInfo = error
    }

}
