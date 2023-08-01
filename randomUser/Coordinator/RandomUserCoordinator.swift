//
//  RandomUserCoordinator.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import UIKit

protocol RandomUserFlow: AnyObject {
    func coordinateToMaps()
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
    func coordinateToMaps() {
        let mapsCoordinator = MapsCoordinator(navigationController: navigationController)
        coordinate(to: mapsCoordinator)
    }
}
