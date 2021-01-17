//
//  AddClientInteractorStub.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class AddClientInteractorStub: BaseInteractor<ClientType, Void> {
    var success = true
    override func useCase(params: ClientType?) -> Result<Void, Error> {
        if success {
            return .success(())
        } else {
            return .failure(BankError.NotFoundClient)
        }
    }
}
