//
//  AuthService.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation
import FirebaseAuth

final class AuthService: ReadOnlyAuthServiceProtocol {
    // MARK: - Declaration objects
    typealias UserType = User
    var currentUser: User? {
        return auth.currentUser
    }
    private let auth: Auth

    // MARK: - Init
    init() {
        self.auth = Auth.auth()
    }
}

// MARK: - Autn functions
extension AuthService {
    func signUp(with user: UserData, completion: @escaping (Result<User, Error>) -> Void) {
        guard let password = user.password else {
            completion(.failure(FirebaseError.nilData))
            return
        }
        auth.createUser(withEmail: user.email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error {
                completion(.failure(error))
            }
        }
    }

    func signIn(with user: UserData, completion: @escaping (Result<User, Error>) -> Void) {
        guard let password = user.password else {
            completion(.failure(FirebaseError.nilData))
            return
        }
        auth.signIn(withEmail: user.email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func signOut() {
        do {
            try auth.signOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
