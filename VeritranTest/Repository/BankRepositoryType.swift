//
//  BankRepositoryType.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import Foundation

protocol BankRepositoryType {
    func addClient(_ client: ClientType)
    func deposits(id: String, value: Double) throws
    func withdrawsMoney(id: String,value: Double) throws -> Double
    func getBalance(id: String) throws -> Double
}
