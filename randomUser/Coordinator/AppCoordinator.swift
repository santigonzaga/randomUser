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
        let randomUserVC = Factory.shared.createRandomUserVC()
        
        window.rootViewController = randomUserVC
        window.makeKeyAndVisible()
    }
}
