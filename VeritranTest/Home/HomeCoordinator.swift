//
//  HomeCoordinator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol HomeCoordinatorDelegate: BaseCoordinatorType {

}

final class HomeCoordinator: BaseCoordinator {    
    func start(repository: BankRepositoryType, id: String) {
        let moduleInput = HomeConfigurator.ModuleInput(coordinator: self, id: id, repository: repository)
        let module = HomeConfigurator.configure(moduleInput: moduleInput)
        router.push(module, transition: .none, animated: true, completion: nil)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    
}
