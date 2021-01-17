//
//  RegisterContract.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol RegisterPresenterType: PresenterType {
    func set(id: String)
    func set(value: Double)
    func register()
}

protocol RegisterViewType: ViewType {
    func showHome()
}
