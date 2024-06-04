//
//  LogInViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class LogInViewModel {
    var isSuccessfullyLogIn = Observable(false)
    var firebaseError = Observable("")
    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func logIn(with user: UserData) {
        authService.signIn(with: user) { [weak self] result in
            switch result {
            case .success(_):
                self?.isSuccessfullyLogIn.value = true
            case .failure(let error):
                self?.firebaseError.value = error.localizedDescription
            }
        }
    }
}
