//
//  BankRepository.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

final class BankRepository: BankRepositoryType {
 
    private var bank: BankType
    
    init(bank: BankType) {
        self.bank = bank
    }
    
    func addClient(_ client: ClientType) {
        bank.add(client: client)
    }
    
    func deposits(id: String, value: Double) throws {
        try bank.deposits(id: id, value: value)
    }
    
    func withdrawsMoney(id: String, value: Double) throws -> Double {
        try bank.withdrawsMoney(id: id, value: value)
    }
    
    func getBalance(id: String) throws -> Double {
        try bank.getBalance(id: id)
    }
}
