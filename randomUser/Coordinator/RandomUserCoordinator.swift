//
//  RandomUserCoordinator.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import UIKit

protocol RandomUserFlow: AnyObject {
    func coordinateToMaps(coordinates: Coordinates)
}

class RandomUserCoordinator: Coordinator, RandomUserFlow {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let randomVC = Factory.shared.createRandomUserVC()
        randomVC.coordinator = self
        
        navigationController.pushViewController(randomVC, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToMaps(coordinates: Coordinates) {
        let mapsCoordinator = MapsCoordinator(navigationController: navigationController,
                                              coordinates: coordinates)
        coordinate(to: mapsCoordinator)
    }
}
