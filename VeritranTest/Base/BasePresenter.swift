//
//  BasePresenter.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import Foundation

class BasePresenter {
    
    var view: ViewType?
    
    func bind(_ view: ViewType) {
        self.view = view
    }

    deinit {
        self.view = nil
    }

}
