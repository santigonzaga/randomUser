//
//  Coordinator.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 28/07/23.
//

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
