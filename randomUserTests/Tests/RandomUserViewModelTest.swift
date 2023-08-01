//
//  RandomUserViewModelTest.swift
//  randomUserTests
//
//  Created by Santiago del Castillo Gonzaga on 31/07/23.
//

import XCTest
import RxSwift
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
        super.tearDown()
    }
    
    func testFetchRandomUserSuccess() {
        let disposeBag = DisposeBag()
        
        sut.fetchRandomUser()
        
        XCTAssertTrue(try sut.isLoading.value())
        XCTAssertEqual(try sut.randomUser.value(), nil)
        
        let expectation = XCTestExpectation(description: "Random user fetched successfully")
        sut.randomUser
            .subscribe(onNext: { user in
                XCTAssertNotNil(user)
                XCTAssertEqual(user?.name.first, "John")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(try sut.isLoading.value())
    }
}
