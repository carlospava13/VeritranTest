//
//  RegisterCoordinator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol RegisterCoordinatorDelgate {
    
}

final class RegisterCoordinator: BaseCoordinator {
    override func start() {
        let moduleInput = RegisterConfigurator.ModuleInput(coordinator: self)
        let module = RegisterConfigurator.configure(moduleInput: moduleInput)
        router.setRootModule(module)
    }
}

extension RegisterCoordinator: RegisterCoordinatorDelgate {
    
}
