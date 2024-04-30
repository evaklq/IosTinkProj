//
//  BaseCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-20.
//

import UIKit

class BaseCoordinator: CoordinatorProtocol {
    var flowCompletionHandler: CompletionHandler?
    var childCoordinators: [CoordinatorProtocol]
    var coordinatorFactory: CoordinatorFactoryProtocol
    var controllerFactory: ControllerFactoryProtocol

    // MARK: - Init
    init() {
        childCoordinators = []
        coordinatorFactory = CoordinatorFactory()
        controllerFactory = ControllerFactory()
    }

    /// func to override in subclasses
    func start() {
        print("base start")
    }
}
