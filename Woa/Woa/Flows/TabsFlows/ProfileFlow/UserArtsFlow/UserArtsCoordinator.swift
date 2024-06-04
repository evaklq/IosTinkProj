//
//  UserArtsCoordinator.swift
//  Woa
//
//  Created by evaklq on 2024-05-18.
//

import UIKit

class UserArtsCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showUserArtsController()
    }

    private func showUserArtsController() {
        let userArtsController = controllerFactory.createUserArtsController()

        userArtsController.flowCompletionHandler = { [weak self] in
            guard let self = self else { return }
            self.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(userArtsController, animated: true)
    }
}

