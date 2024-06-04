//
//  CoordinatorProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var flowCompletionHandler: CompletionHandler? { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var coordinatorFactory: CoordinatorFactoryProtocol { get }

    func start()
}

extension CoordinatorProtocol {
    func addDependency(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorProtocol) {
        guard !childCoordinators.isEmpty else { return }

        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
