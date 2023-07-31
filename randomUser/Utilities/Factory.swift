//
//  Factory.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 30/07/23.
//

import UIKit

class Factory {
    static let shared: Factory = Factory()
    
    func createRandomUserVC() -> RandomUserViewController {
        let viewModel = RandomUserViewModel()
        let randomUserVC = RandomUserViewController(viewModel: viewModel)
        
        return randomUserVC
    }
}
