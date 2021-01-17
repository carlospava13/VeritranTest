//
//  BankRespositoryStub.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class BankRespositoryStub: BankRepositoryType {
    func addClient(_ client: ClientType) {}
    
    func deposits(id: String, value: Double) throws { }
    
    func withdrawsMoney(id: String, value: Double) throws -> Double {
        0.0
    }
    
    func getBalance(id: String) throws -> Double {
        0.0
    }
}
