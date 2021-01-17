//
//  HomeConfigurator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import UIKit

final class HomeConfigurator {
    
    static func configure(moduleInput: HomeConfigurator.ModuleInput) -> UIViewController {
        let homeViewController = HomeViewController()
        let dependencies = createDependencies(coordinator: moduleInput.coordinator,
                                              id: moduleInput.id,
                                              repository: moduleInput.repository)
        let presenter = HomePresenter(dependencies: dependencies)
        homeViewController.presenter = presenter
        return homeViewController
    }
    
    private static func createDependencies(coordinator: HomeCoordinatorDelegate?,
                                           id: String,
                                           repository: BankRepositoryType) -> HomePresenter.InputDependencies {
        
        let balanceInteractor = BalanceInteractor(repository: repository)
        let withdrawsMoneyInteractor = WithdrawsMoneyInteractor(repository: repository)
        return HomePresenter.InputDependencies(coodinator: coordinator,
                                               id: id,
                                               balanceInteractor: balanceInteractor,
                                               withdrawsMoneyInteractor: withdrawsMoneyInteractor)
    }
    
}

extension HomeConfigurator {
    struct ModuleInput {
        var coordinator: HomeCoordinatorDelegate?
        var id: String
        var repository: BankRepositoryType
    }
}

