//
//  RandomUserViewModel.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 28/07/23.
//

import Foundation
import RxSwift

protocol RandomUserViewModelProtocol {
    var randomUser: Observable<RandomUser?> { get }
    var isLoading: Observable<Bool> { get }
    func fetchRandomUser()
}

class RandomUserViewModel: RandomUserViewModelProtocol {
    let webService: WebServiceProtocol
    
    private let _randomUser: BehaviorSubject<RandomUser?> = BehaviorSubject(value: nil)
    var randomUser: Observable<RandomUser?> { _randomUser.asObservable() }

    private let _isLoading: BehaviorSubject<Bool> = BehaviorSubject(value: false)
    var isLoading: Observable<Bool> { _isLoading.asObservable() }
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func fetchRandomUser() {
        _isLoading.onNext(true)
        
        webService.fetchRandomUser { [weak self] result in
            self?._isLoading.onNext(false)
            
            switch result {
            case .success(let randomUser):
                self?._randomUser.onNext(randomUser)
            case .failure(let error):
                print("Error fetching random user: \(error)")
            }
        }
    }
}
