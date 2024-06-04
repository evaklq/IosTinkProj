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
                self?.showUserArtsFlow()
            case .purchases:
                self?.showUserPurchasesController()
            case .favorites:
                self?.showFavoritesController()
            }
        }
        router.setRootController(profileController)
    }

    private func showChangeProfileController() {
        let changeProfileController = controllerFactory.createChangeProfileController()

        changeProfileController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(changeProfileController, animated: true)
    }

    private func showUserPurchasesController() {
        let userPurchasesController = controllerFactory.createUserPurchasesController()

        userPurchasesController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(userPurchasesController, animated: true)
    }

    private func showFavoritesController() {
        let favoritesController = controllerFactory.createFavoritesController()

        favoritesController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(favoritesController, animated: true)
    }

    private func showUserArtsFlow() {
        let userArtsCoordinator = coordinatorFactory.createUserArtsCoordinator(router: router)
        addDependency(userArtsCoordinator)
        userArtsCoordinator.flowCompletionHandler = { [weak self, userArtsCoordinator] in
            self?.removeDependency(userArtsCoordinator)
        }

        userArtsCoordinator.start()
    }
}
