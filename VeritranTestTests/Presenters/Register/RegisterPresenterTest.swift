//
//  RegisterPresenterTest.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import XCTest
@testable import VeritranTest

final class RegisterPresenterTest: XCTestCase {
    
    private var addClientInteractorStub: AddClientInteractorStub!
    private var depositsInteractorStub: DepositsInteractorStub!
    private var bankRespositoryStub: BankRespositoryStub!
    private var coordinatorSpy: RegisterCoordinatorSpy!
    //System Under Test
    
    private var sut: RegisterPresenterType!
    
    override func setUp() {
        super.setUp()
        bankRespositoryStub = BankRespositoryStub()
        addClientInteractorStub = AddClientInteractorStub(repository: bankRespositoryStub)
        depositsInteractorStub = DepositsInteractorStub(repository: bankRespositoryStub)
        coordinatorSpy = RegisterCoordinatorSpy()
        let dependencies = RegisterPresenter.InputDependencies(coodinator: coordinatorSpy,
                                                               addClientInteractor: addClientInteractorStub,
                                                               depositsInteractor: depositsInteractorStub)
        sut = RegisterPresenter(dependencies: dependencies)
    }
    
    override func tearDown() {
        addClientInteractorStub = nil
        depositsInteractorStub = nil
        sut = nil
        coordinatorSpy = nil
        super.tearDown()
    }
    
    func testRegister_WhenWithoutValue_ThenShowHome() {
        //Given
        let expectation = XCTestExpectation(description: "register test")
        var expectedValue = false
        sut.set(id: "Carlos")
        // When
        
        coordinatorSpy.showHomeCallBack = {
            expectedValue = true
            expectation.fulfill()
        }
        
        sut.register()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(expectedValue)
    }
    
    func testRegister_WhenValue_ThenShowHome() {
        //Given
        let expectation = XCTestExpectation(description: "register test")
        var expectedValue = false
        sut.set(id: "Carlos")
        sut.set(value: 10)
        // When
        
        coordinatorSpy.showHomeCallBack = {
            expectedValue = true
            expectation.fulfill()
        }
        
        sut.register()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(expectedValue)
    }
    
    func testRegister_WhenAddClientInteractorFail_ThenShowError() {
        //Given
        let expectation = XCTestExpectation(description: "register test")
        var expectedValue = false
        addClientInteractorStub.success = false
        sut.set(id: "Carlos")
        
        // When
        coordinatorSpy.showErrorCallBack = {
            expectedValue = true
            expectation.fulfill()
        }
        
        sut.register()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(expectedValue)
    }
    
    func testRegister_WhenDepositsInteractorFail_ThenShowError() {
        //Given
        let expectation = XCTestExpectation(description: "register test")
        var expectedValue = false
        depositsInteractorStub.success = false
        sut.set(id: "Carlos")
        
        // When
        coordinatorSpy.showErrorCallBack = {
            expectedValue = true
            expectation.fulfill()
        }
        
        sut.register()
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(expectedValue)
    }
}
