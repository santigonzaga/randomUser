//
//  RandomUserViewModelTest.swift
//  randomUserTests
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import XCTest
@testable import randomUser

class RandomUserViewModelTest: XCTestCase {
    var sut: RandomUserViewModel?
    var webServiceMock: WebServiceMock?
    
    override func setUp() {
        super.setUp()
        let webServiceMock = WebServiceMock()
        self.webServiceMock = webServiceMock
        self.sut = RandomUserViewModel(webService: webServiceMock)
    }
    
    override func tearDownWithError() throws {
        self.webServiceMock = nil
        self.sut = nil
    }
}
