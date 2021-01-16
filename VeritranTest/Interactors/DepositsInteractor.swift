//
//  DepositsInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

struct DepositsInfo {
    var id: String
    var value: Double
}

final class DepositsInteractor: BaseInteractor<DepositsInfo, Void> {

    override func useCase(params: DepositsInfo?) -> Result<Void, Error> {
        do {
            try repository.deposits(id: params!.id, value: params!.value)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
