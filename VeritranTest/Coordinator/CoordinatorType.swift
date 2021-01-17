//
//  CoordinatorType.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

protocol CoordinatorType: AnyObject {
    var childCoordinators: [CoordinatorType] { get set }
    var router: RouterType { get }
    func start()
    func showAlert(error: Error)
}
