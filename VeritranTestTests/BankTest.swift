//
//  BankTest.swift
//  VeritranTestTests
//
//  Created by carlos pava on 15/01/21.
//

import XCTest
@testable import VeritranTest

class BankTest: XCTestCase {
    
    private var bank: BankType!
    private var client: ClientType!
    private var account: AccountType!
    private var id: String? = "carlos"
    
    public override func setUp() {
        super.setUp()
        bank = Bank()
        account = Account()
        client = Client(id: id!, account: account)
    }
    
    override func tearDown() {
        bank = nil
        client = nil
        account = nil
        id = nil
        super.tearDown()
    }
    
    
    func testDeposits_WhenSetNewClient_ThenDepositsSuccess() {
        bank.add(client: client)
          
        XCTAssertNoThrow(try bank.deposits(id: id!, value: 50))
    }
    
    func testWithdrawsMoney_WhenThereIsNegativeValue_ThenReturnError() {
        bank.add(client: client)
        XCTAssertNoThrow(try bank.deposits(id: id!, value: 100.0))
        XCTAssertThrowsError(try bank.withdrawsMoney(id: id!, value: -120.0))
    }
    
    func testWithdrawsMoney_WhenThereIsNotMoney_ThenReturnError () {
        XCTAssertThrowsError(try bank.deposits(id: id!, value: 50))
    }
    
    func testWithdrawsMoney_WhenThereIsMoney_ThenReturnValue () {
        let expectedValue = 50.0
        bank.add(client: client)
        do {
            try bank.deposits(id: id!, value: 100)
            let value = try bank.withdrawsMoney(id: id!, value: 50)
            XCTAssertEqual(value, expectedValue)
        } catch {
            XCTFail()
        }
    }
    
    func testGetBalance_WhenClintNotExits_ThenReturError() {
        XCTAssertThrowsError(try bank.getBalance(id: id!))
    }
    
    func testGetBalance_WhenClientExistAndDoesNotHaveMoney_ThenReturnZeroBalance() {
        bank.add(client: client)
       
        XCTAssertNoThrow(try bank.getBalance(id: id!))
    }
    
    func testGetBalance_WhenClientExistAndHaveMoney_ThenReturnBalance() {
        let expectedValue = 100.0
        bank.add(client: client)
        
        do {
            try bank.deposits(id: id!, value: 100)
            let balance = try bank.getBalance(id: id!)
            XCTAssertEqual(balance, expectedValue)
        }catch {
            XCTFail()
        }
    }
}
