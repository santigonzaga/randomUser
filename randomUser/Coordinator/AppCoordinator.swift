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
        let vc = RandomUserViewController(viewModel: "")
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
