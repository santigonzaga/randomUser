//
//  MapsViewModel.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import Foundation

protocol MapsViewModelProtocol {
    var latitude: Double { get }
    var longitude: Double { get }
}

class MapsViewModel: MapsViewModelProtocol {
    let latitude: Double
    let longitude: Double
    
    init(coordinates: Coordinates) {
        self.latitude = Double(coordinates.latitude) ?? 0
        self.longitude = Double(coordinates.longitude) ?? 0
    }
}
