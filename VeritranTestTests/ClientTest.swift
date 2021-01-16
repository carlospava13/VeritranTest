//
//  ClientTest.swift
//  VeritranTestTests
//
//  Created by carlos pava on 15/01/21.
//

import XCTest
@testable import VeritranTest

class ClientTest: XCTestCase {
    private var client: ClientType!
    private var id: String? = "carlos"
    override func setUp() {
        client = Client(id: id!, account: Account())
    }
    
    override func tearDown() {
        client = nil
        super.tearDown()
    }
    
    func testGetID() {
        let expectedValue = "carlos"
        XCTAssertEqual(client.getID(), expectedValue)
    }
    
    func testGetAccount() {
        XCTAssertNotNil(client.getAccount())
    }
}
