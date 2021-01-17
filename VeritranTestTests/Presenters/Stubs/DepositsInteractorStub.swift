//
//  DepositsInteractorStub.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class DepositsInteractorStub: BaseInteractor<DepositsInfo, Void> {
    var success = true
    override func useCase(params: DepositsInfo?) -> Result<Void, Error> {
        if success {
            return .success(())
        }else {
            return .failure(AccountError.IsNotPosibleTransacction)
        }
    }
}
