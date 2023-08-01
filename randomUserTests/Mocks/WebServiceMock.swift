//
//  WebServiceMock.swift
//  randomUserTests
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import Foundation

class WebServiceMock: WebServiceProtocol {
    let randomUser = RandomUser(name: Name(title: "Ms",
                                           first: "Catalina",
                                           last: "de la Fuente"),
                                location: Location(city: "Tequesquitengo",
                                                   state: "Nuevo Leon",
                                                   country: "Mexico",
                                                   coordinates: Coordinates(latitude: "21.6082",
                                                                            longitude: "56.0840")),
                                picture: Picture(medium: URL(string: "https://randomuser.me/api/portraits/med/women/59.jpg")!))
    
    func fetchRandomUser(handler: @escaping (Result<RandomUser, WebServiceError>) -> Void) {
        handler(.success(randomUser))
    }
}
