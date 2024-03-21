//
//  FamousArtsCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class FamousArtsCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showFamousArtsController()
    }

    private func showFamousArtsController() {
        let famousArtsController = FamousArtsViewController()
        router.setRootController(famousArtsController)
    }
}
