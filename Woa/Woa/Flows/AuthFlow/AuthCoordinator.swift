//
//  AuthCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class AuthCoordinator: BaseCoordinator {
    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showSignUpController()
    }
}

// MARK: - Configure flows actions
extension AuthCoordinator {
    private func showSignUpController() {
        let signUpController = controllerFactory.createSignUpController()

        signUpController.flowCompletionHandlerWithValue = { [weak self] info in
            let states = info.accountState
            switch states {
            case .alreadyReg:
                self?.showLogInController(info.email, info.pass)
            case .needReg:
                self?.flowCompletionHandler?()
            }
        }
        router.setRootController(signUpController)
    }

    private func showLogInController(_ email: String?, _ pass: String?) {
        let logInController = controllerFactory.createLogInController(email: email, pass: pass)

        logInController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.push(logInController, animated: true)
    }
}
