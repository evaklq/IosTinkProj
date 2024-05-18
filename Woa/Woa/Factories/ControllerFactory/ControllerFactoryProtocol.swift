//
//  ControllerFactoryProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import Foundation

protocol ControllerFactoryProtocol {
    func createSignUpController() -> SignUpViewController
    func createLogInController(email: String?, pass: String?) -> LogInViewController
    func createFamousArtsController() -> FamousArtsViewController
    func createCartController() -> CartViewController
    func createArtsStoreController() -> ArtsStoreViewController
    func createProfileController() -> ProfileViewController
    func createChangeProfileController() -> ChangeProfileViewController
    func createUserArtsController() -> UserArtsViewController
}
