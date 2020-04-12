//
//  UIViewController+Extension.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var naviGap: CGFloat {
        return Screen.hasNotch ? 88.0 : 64.0
    }
    
    var bottomGap: CGFloat {
        return Screen.hasNotch ? 34.0 : 0.0
    }
    
    func topViewController() -> UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = self as? UITabBarController {
            if let seleted = tabBarController.selectedViewController {
                return seleted.topViewController()
            }
        }
        
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topViewController()
        }
        
        return self
    }
    
}
