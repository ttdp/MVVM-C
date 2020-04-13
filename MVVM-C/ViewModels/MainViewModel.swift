//
//  MainViewModel.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func gotoLogin()
    func gotoRegister()
}

class MainViewModel: ViewModelProtocol {
    
    var coordinator: MainViewModelDelegate?
    
    var news: [String] = []
    
    let dataModel: MainDataModelProtocol
    
    init(dataModel: MainDataModelProtocol = MainDataModel()) {
        self.dataModel = dataModel
    }
    
    func loadNews(completion: @escaping () -> Void) {
        dataModel.fetchNews { news in
            self.news = news
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func showLogin() {
        coordinator?.gotoLogin()
    }
    
    func showRegister() {
        coordinator?.gotoRegister()
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: Constant.isLoggedIn)
    }
    
}
