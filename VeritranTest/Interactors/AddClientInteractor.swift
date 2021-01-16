//
//  AddClientInteractor.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

final class AddClientInteractor: BaseInteractor<ClientType, Void> {

    override func useCase(params: ClientType?) -> Result<Void, Error> {
        repository.addClient(params!)
        return .success(())
    }
}
