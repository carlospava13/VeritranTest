//
//  RegisterCoordinator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol RegisterCoordinatorDelgate {
    func showHome(id: String)
}

final class RegisterCoordinator: BaseCoordinator {
    
    private var repository: BankRepositoryType
    
    init(router: RouterType, repository: BankRepositoryType) {
        self.repository = repository
        super.init(router: router)
    }
    
    override func start() {
        let moduleInput = RegisterConfigurator.ModuleInput(coordinator: self,
                                                           repository: repository)
        let module = RegisterConfigurator.configure(moduleInput: moduleInput)
        router.setRootModule(module)
    }
}

extension RegisterCoordinator: RegisterCoordinatorDelgate {
    func showHome(id: String) {
        let coordinator = HomeCoordinator(router: router)
        coordinator.start(repository: repository, id: id)
    }
}
