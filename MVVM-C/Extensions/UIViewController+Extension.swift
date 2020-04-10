//
//  UIViewController+Extension.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

extension UIViewController {
    
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
