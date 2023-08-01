//
//  AppCoordinator.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 28/07/23.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let randomUserCoordinator = RandomUserCoordinator(navigationController: navigationController)
        coordinate(to: randomUserCoordinator)
    }
}
