//
//  BaseCoordinatorSpy.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

class BaseCoordinatorSpy: BaseCoordinatorType {
  
    var showErrorCallBack: (() -> Void)?
    
    func showAlert(error: Error) {
        showErrorCallBack?()
    }
}
