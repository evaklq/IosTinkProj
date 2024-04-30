//
//  FamousArtsCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class FamousArtsCoordinator: BaseCoordinator {

    var router: Router
    private let controllerFactory = ControllerFactory()

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showFamousArtsController()
    }

    private func showFamousArtsController() {
        let famousArtsController = controllerFactory.createFamousArtsController()
        router.setRootController(famousArtsController)
    }
}
