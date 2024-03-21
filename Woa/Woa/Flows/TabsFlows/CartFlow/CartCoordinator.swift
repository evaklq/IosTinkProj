//
//  CartCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class CartCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showCartController()
    }

    private func showCartController() {
        let cartController = CartViewController()
        router.setRootController(cartController)
    }
}
