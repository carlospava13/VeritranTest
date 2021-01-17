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
    }
    
    private var dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
}

extension RegisterPresenter: RegisterPresenterType {
    
}
