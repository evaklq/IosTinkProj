//
//  ProfileCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ProfileCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showProfileController()
    }

    private func showProfileController() {
        let profileController = ProfileViewController()
        router.setRootController(profileController)
    }
}
