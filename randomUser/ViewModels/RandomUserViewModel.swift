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
    
    init() {
        
    }
    
    func fetchRandomUser() {
        WebService.shared.fetchRandomUser { result in
            switch result {
            case .success(let randomUser):
                print(randomUser)
            case .failure(let error):
                print(error)
            }
        }
    }
}
