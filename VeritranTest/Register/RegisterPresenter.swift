//
//  RegisterPresenter.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

final class RegisterPresenter: BasePresenter {
    
    struct InputDependencies {
        var coodinator: RegisterCoordinatorDelgate?
        var addClientInteractor: BaseInteractor<ClientType, Void>
        var depositsInteractor: BaseInteractor<DepositsInfo, Void>
    }
    
    private var id: String = String()
    private var value: Double = 0.0
    private var dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    func setValue() {
        let info = DepositsInfo(id: id, value: value)
        let result = dependencies.depositsInteractor.useCase(params: info)
        switch result {
        case .success:
            break
        case .failure(let error):
            print(error)
        }
    }
}

extension RegisterPresenter: RegisterPresenterType {
    func set(id: String) {
        self.id = id
    }
    
    func set(value: Double) {
        self.value = value
    }
    
    func register() {
        let client = Client(id: id, account: Account())
        let result = dependencies.addClientInteractor.useCase(params: client)
        switch result {
        case .success:
            setValue()
            break
        case .failure(let error):
            print(error)
            break
        }
    }
}
