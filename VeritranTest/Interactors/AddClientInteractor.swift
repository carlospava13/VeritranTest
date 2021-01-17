//
//  AddClientInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

final class AddClientInteractor: BaseInteractor<ClientType, Void> {

    override func useCase(params: ClientType?) -> Result<Void, Error> {
        guard let client = params else {
            return .failure(BankError.NotFoundClient)
        }
        repository.addClient(client)
        return .success(())
    }
}
