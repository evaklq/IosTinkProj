//
//  ControllerFactory.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import Foundation

final class ControllerFactory: ControllerFactoryProtocol {
    private let authService: AuthServiceProtocol
    private let validationService: ValidationServiceProtocol
    private let dataBaseService: FirestoreDbServiceProtocol

    init(
        authService: AuthServiceProtocol = AuthService.shared,
        validationService: ValidationServiceProtocol = ValidationService.shared,
        dataBaseService: FirestoreDbServiceProtocol = FirestoreDbService.shared
    ) {
        self.authService = authService
        self.validationService = validationService
        self.dataBaseService = dataBaseService
    }

    func createSignUpController() -> SignUpViewController {
        let viewModel = SignUpViewModel(auth: authService, validation: validationService, dataBase: dataBaseService)
        let controller = SignUpViewController(viewModel: viewModel)

        return controller
    }
    
    func createLogInController(email: String?, pass: String?) -> LogInViewController {
        let viewModel = LogInViewModel(authService: authService)
        let controller = LogInViewController(viewModel: viewModel, email: email, pass: pass)

        return controller
    }

    func createFamousArtsController() -> FamousArtsViewController {
        let viewModel = FamousArtsViewModel()
        let controller = FamousArtsViewController(viewModel: viewModel)

        return controller
    }
}
