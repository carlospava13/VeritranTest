//
//  AccountTest.swift
//  VeritranTestTests
//
//  Created by carlos pava on 15/01/21.
//

import XCTest
@testable import VeritranTest

class AccountTest: XCTestCase {
    
    private var account: AccountType!

    override  func setUp() {
        account = Account()
    }
    
    override  func tearDown() {
        account = nil
        super.tearDown()
    }
    
    func testDeposits_WhenPositiveValue_ThenSetValue() {
        XCTAssertNoThrow(try account.deposits(value: 10))
    }

    func testDeposits_WhenThereIsNegativeValue_ThenReturnError() {
        XCTAssertThrowsError(try account.deposits(value: -10))
    }
    
    func testWithdrawsMoney_WhenThereIsNotMoney_ThenReturnError() {
        XCTAssertThrowsError(try account.withdrawsMoney(value: 10))
    }
    
    func testWithdrawsMoney_WhenThereIsMoney_ThenReturnValue() {
        do {
            try account.deposits(value: 10)
        } catch {
            XCTFail()
        }
        XCTAssertNoThrow(try account.withdrawsMoney(value: 10))
    }
    
    func testGetBalance_WhenThereAreNotMoney_ThenReturnZero() {
        let expectedValue = 0.0
        XCTAssertEqual(account.getBalance(), expectedValue)
    }
    
    func testGetBalance_WhenThereAreMoney_ThenReturnZero() {
        do {
            try account.deposits(value: 10)
        } catch {
            XCTFail()
        }
        let expectedValue = 10.0
        XCTAssertEqual(account.getBalance(), expectedValue)
    }
}
