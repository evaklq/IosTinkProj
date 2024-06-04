//
//  SignUpViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation
import FirebaseAuth

final class SignUpViewModel {
    var isSuccessfullySignUp = Observable(false)
    var nickError = Observable("")
    var emailError = Observable("")
    var ageError = Observable("")
    var passError = Observable("")
    var firebaseError = Observable("")
    private let authService: AuthServiceProtocol
    private let validationService: ValidationServiceProtocol
    private let dbService: FirestoreDbServiceProtocol

    init(auth: AuthServiceProtocol, validation: ValidationServiceProtocol, dataBase: FirestoreDbServiceProtocol) {
        self.authService = auth
        self.validationService = validation
        self.dbService = dataBase
    }

    func regUser(_ nick: String?, _ email: String?, _ age: Int?, _ pass: String?) {
        let errors = validationService.validateUser(nick: nick, email: email, password: pass, age: age)

        if let errors = errors {
            readErrors(errors)
            return
        }

        var user = UserData(nick: nick, email: email, password: pass, age: age)

        authService.signUp(with: user) { [weak self] result in
            switch result {
            case .success(let fireUser):
                user.id = fireUser.id

                self?.dbService.saveUserData(with: user) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(_):
                        self.isSuccessfullySignUp.value = true
                    case .failure(let error):
                        self.firebaseError.value = error.localizedDescription
                    }
                }
            case .failure(let error):
                self?.firebaseError.value = error.localizedDescription
            }
        }
    }
}

private extension SignUpViewModel {
    func configureArrayToString(_ array: [String]) -> String {
        let result = array.joined(separator: "\n")
        return result
    }

    func readErrors(_ errors: [ValidationErrorType: [String]]) {
        let nickErrors = errors[.nick]
        if let nickErrors = nickErrors {
            nickError.value = configureArrayToString(nickErrors)
        }

        let emailErrors = errors[.email]
        if let emailErrors = emailErrors {
            emailError.value = configureArrayToString(emailErrors)
        }

        let ageErrors = errors[.age]
        if let ageErrors = ageErrors {
            ageError.value = configureArrayToString(ageErrors)
        }

        let passErrors = errors[.password]
        if let passErrors = passErrors {
            passError.value = configureArrayToString(passErrors)
        }
    }
}
