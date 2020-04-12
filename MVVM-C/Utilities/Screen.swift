//
//  Screen.swift
//  MVVM-C
//
//  Created by Tian Tong on 4/12/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

struct Screen {
    
    static var hasNotch: Bool {
        return UIWindow(frame: UIScreen.main.bounds).safeAreaInsets.top > 0
    }
    
}
