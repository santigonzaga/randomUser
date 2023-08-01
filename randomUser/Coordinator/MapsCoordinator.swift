//
//  MapsCoordinator.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import UIKit

protocol MapsFlow: AnyObject {
    func coordinateDismiss()
}

class MapsCoordinator: Coordinator, MapsFlow {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mapsVC = Factory.shared.createMapsVC()
        mapsVC.coordinator = self
        
        let navVc = UINavigationController(rootViewController: mapsVC)
        navigationController?.present(navVc, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateDismiss() {
        navigationController?.dismiss(animated: true)
    }
}
