//
//  AuthCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class AuthCoordinator: BaseCoordinator {
    var router: Router
    private let authService = AuthService.shared
    private let validationService = ValidationService.shared
    private let dbService = FirestoreDbService.shared

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
        let signUpViewModel = SignUpViewModel(auth: authService, validation: validationService, dataBase: dbService)
        let signUpController = SignUpViewController(viewModel: signUpViewModel)
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
        let logInViewModel = LogInViewModel(authService: authService)
        let logInController = LogInViewController(viewModel: logInViewModel, email: email, pass: pass)
        logInController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.push(logInController, animated: true)
    }
}
