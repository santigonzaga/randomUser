//
//  RandomUserViewModel.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 28/07/23.
//

import Foundation

protocol RandomUserViewModelProtocol {
    func fetchRandomUser()
}

class RandomUserViewModel: RandomUserViewModelProtocol {
    let webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func fetchRandomUser() {
//        webService.fetchRandomUser { result in
//            switch result {
//            case .success(let randomUser):
//                
//            case .failure(let error):
//                
//            }
//        }
    }
}
