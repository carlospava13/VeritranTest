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
        var withdrawsMoneyInteractor: BaseInteractor<WithdrawsMoneyInfo,Double>
        var depositsInteractor: BaseInteractor<DepositsInfo, Void>
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
            dependencies.coodinator?.showAlert(error: error)
        }
    }
    
    func withdrawsMoney(value: Double) {
        let info = WithdrawsMoneyInfo(id: dependencies.id, value: value)
        let result = dependencies.withdrawsMoneyInteractor.useCase(params: info)
        switch result {
        case .success:
            getBalance()
        case .failure(let error):
            dependencies.coodinator?.showAlert(error: error)
        }
    }
    
    func depositsMoney(value: Double) {
        let info = DepositsInfo(id: dependencies.id, value: value)
        let result = dependencies.depositsInteractor.useCase(params: info)
        switch result {
        case .success:
            getBalance()
        case .failure(let error):
            dependencies.coodinator?.showAlert(error: error)
        }
    }
}
