//
//  BalanceInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

final class BalanceInteractor: BaseInteractor<String, Double> {
    override func useCase(params: String?) -> Result<Double, Error> {
        do {
           let balance = try repository.getBalance(id: params!)
            return .success(balance)
        } catch {
            return .failure(error)
        }
    }
}
