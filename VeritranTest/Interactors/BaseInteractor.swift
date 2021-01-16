//
//  BaseInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

protocol BaseInteractorType {
    associatedtype P
    associatedtype T
    func useCase(params:P?) -> Result<T,Error>
}

class BaseInteractor<P,T>: BaseInteractorType {
    
    var repository: BankRepositoryType
    
    init(repository: BankRepositoryType) {
        self.repository = repository
    }
    
    func useCase(params: P?) -> Result<T, Error> {
        return .success(T.self as! T)
    }
}
