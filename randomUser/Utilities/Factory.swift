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
    
    func createMapsVC(coordinates: Coordinates) -> MapsViewController {
        let viewModel = MapsViewModel(coordinates: coordinates)
        let mapsVC = MapsViewController(viewModel: viewModel)
        
        return mapsVC
    }
}
