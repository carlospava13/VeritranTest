//
//  ClientDummy.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class ClientDummy: ClientType {
    private var id: String
    private var account: AccountType
    init(id: String, account: AccountType) {
        self.id = id
        self.account = account
    }
    
    func getID() -> String {
        id
    }
    
    func getAccount() -> AccountType {
        account
    }
}
