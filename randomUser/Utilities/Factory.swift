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
        let webService = WebService.shared
        let viewModel = RandomUserViewModel(webService: webService)
        let randomUserVC = RandomUserViewController(viewModel: viewModel)
        
        return randomUserVC
    }
    
    func createMapsVC() -> MapsViewController {
        let viewModel = MapsViewModel()
        let mapsVC = MapsViewController(viewModel: viewModel)
        
        return mapsVC
    }
}
