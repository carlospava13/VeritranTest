//
//  HomePresenter.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

final class HomePresenter: BasePresenter {
    
    struct InputDependencies {
        var coodinator: HomeCoordinatorDelegate?
        var id: String
        var balanceInteractor: BaseInteractor<String, Double> 
    }
    
    private var dependencies: InputDependencies
    
    private var ownView: HomeViewType! {
        view as? HomeViewType
    }
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
}

extension HomePresenter: HomePresenterType {
    func getBalance() {
       let result = dependencies.balanceInteractor.useCase(params: dependencies.id)
        switch result {
        case .success(let balance):
            ownView.set(balance: String(balance))
        case .failure(let error):
            print(error)
        }
    }
}
