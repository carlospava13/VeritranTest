//
//  AccountDummy.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class AccountDummy: AccountType {
    func deposits(value: Double) throws { }
    
    func getBalance() -> Double {
        0.0
    }
    
    func withdrawsMoney(value: Double) throws -> Double {
        0.0
    }
}
