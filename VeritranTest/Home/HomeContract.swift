//
//  HomeContract.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol HomePresenterType: PresenterType {
    func getBalance()
    func withdrawsMoney(value: Double)
    func depositsMoney(value: Double)
}

protocol HomeViewType: ViewType {
    func set(balance: String)
}
