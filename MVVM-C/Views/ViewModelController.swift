//
//  ViewModelController.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import UIKit

protocol ViewModelProtocol {}

class ViewModelController<T: ViewModelProtocol>: UIViewController {
    
    let viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        // Override by sub-classes
    }
    
}
