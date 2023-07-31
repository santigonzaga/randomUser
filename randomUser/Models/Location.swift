//
//  Location.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import Foundation

struct Location: Codable {
    let city: String
    let state: String
    let country: String
    let coordinates: Coordinates
}
