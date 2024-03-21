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

extension AuthCoordinator {

    private func showSignUpController() {
        let signUpViewModel = SignUpViewModel()
        let signUpController = SignUpViewController(viewModel: signUpViewModel)
        signUpController.flowCompletionHandlerWithValue = { [weak self] states in
            switch states {
            case .reg:
                self?.showLogInController()
            case .unreg:
                self?.flowCompletionHandler?()
            }
        }
        router.setRootController(signUpController)
    }

    private func showLogInController() {
        let logInViewModel = LogInViewModel()
        let logInController = LogInViewController(viewModel: logInViewModel)
        logInController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.push(logInController, animated: true)
    }
}
