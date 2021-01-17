//
//  RegisterCoordinatorSpy.swift
//  VeritranTestTests
//
//  Created by Carlos Pava on 17/01/21.
//

import Foundation
@testable import VeritranTest

final class RegisterCoordinatorSpy: BaseCoordinatorSpy, RegisterCoordinatorDelgate {
    
    var showHomeCallBack: (() -> Void)?
    
    func showHome(id: String) {
        showHomeCallBack?()
    }
}
 
