//
//  RandomUser.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 30/07/23.
//

import Foundation

struct RandomUserResponse: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    let name: Name
    let location: Location
    let cell: String
    let picture: Picture
}
