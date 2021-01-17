//
//  RegisterConfigurator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import UIKit

final class RegisterConfigurator {
    
    static func configure(moduleInput: RegisterConfigurator.ModuleInput) -> UIViewController {

        let registerViewController = RegisterViewController()
        let dependencies = createDependencies(coordinator: moduleInput.coordinator,
                                              repository: moduleInput.repository)
        let presenter = RegisterPresenter(dependencies: dependencies)
        registerViewController.presenter = presenter
        return registerViewController
    }
    
    private static func createDependencies(coordinator: RegisterCoordinatorDelgate?,
                                           repository: BankRepositoryType) -> RegisterPresenter.InputDependencies {
        let interactor = AddClientInteractor(repository: repository)
        let depositsInteractor = DepositsInteractor(repository: repository)
        return RegisterPresenter.InputDependencies(coodinator: coordinator,
                                                   addClientInteractor: interactor,
                                                   depositsInteractor: depositsInteractor)
    }
    
}

extension RegisterConfigurator {
    struct ModuleInput {
        var coordinator: RegisterCoordinatorDelgate?
        var repository: BankRepositoryType
    }
}
