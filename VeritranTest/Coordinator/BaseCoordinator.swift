//
//  BaseCoordinator.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import UIKit

protocol BaseCoordinatorType {
    func showAlert(error: Error)
}

class BaseCoordinator: CoordinatorType {
    
    var childCoordinators: [CoordinatorType] = []
    var router: RouterType
    weak var removeReferenceDelegete: RemoveReferenceDelegate?
    
    init(router: RouterType) {
        self.router = router
    }

    func start() {}

    func addDependency(_ coordinator: CoordinatorType) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorType?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func toPresent() -> UIViewController {
        let viewController = router.toPresent()
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
}

extension BaseCoordinator: BaseCoordinatorType {
    func showAlert(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        router.present(alertController)
    }
}
