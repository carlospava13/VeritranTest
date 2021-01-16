//
//  WithdrawsMoneyInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

struct WithdrawsMoneyInfo {
    var id: String
    var value: Double
}

final class WithdrawsMoneyInteractor: BaseInteractor<WithdrawsMoneyInfo,Double> {
    override func useCase(params: WithdrawsMoneyInfo?) -> Result<Double, Error> {
        do {
           let value = try repository.withdrawsMoney(id: params!.id, value: params!.value)
            return .success(value)
        } catch {
            return .failure(error)
        }
    }
}
