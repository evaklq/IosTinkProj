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
        let profileController = controllerFactory.createProfileController()

        profileController.flowCompletionHandlerWithValue = { [weak self] info in
            switch info {
            case .changeProfile:
                self?.showChangeProfileController()
            case .userArts:
                self?.showUserArtsController()
            }
        }
        router.setRootController(profileController)
    }

    private func showChangeProfileController() {
        let changeProfileController = controllerFactory.createChangeProfileController()

        changeProfileController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.push(changeProfileController, animated: true)
    }

    private func showUserArtsController() {
        let userArtsController = controllerFactory.createUserArtsController()

        userArtsController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.push(userArtsController, animated: true)
    }
}
