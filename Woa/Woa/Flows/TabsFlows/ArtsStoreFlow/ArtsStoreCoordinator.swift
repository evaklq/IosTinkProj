//
//  ArtsStoreCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ArtsStoreCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showArtsStoreController()
    }

    private func showArtsStoreController() {
        let artsStoreController = controllerFactory.createArtsStoreController()
        router.setRootController(artsStoreController)
    }
}
