//
//  MainViewController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

class MainViewController: ViewModelController<MainViewModel> {
    
    // MARK: - Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleLogin))
        navigationItem.rightBarButtonItem = addButton
        
        view.backgroundColor = .gray
    }
    
    // MARK: - Action
    
    @objc func handleLogin() {
        viewModel.showLogin()
    }
    
}
