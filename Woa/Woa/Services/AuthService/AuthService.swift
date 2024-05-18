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
    static let shared = AuthService()
    private let networkService = NetworkService.shared
    var currentUser: AuthUserProtocol? {
        return auth.currentUser
    }
    private let auth: Auth

    // MARK: - Init
    private init() {
        self.auth = Auth.auth()
    }
}

// MARK: - Autn functions
extension AuthService {
    func signUp(with user: UserData, completion: @escaping (Result<AuthUserProtocol, Error>) -> Void) {
        guard let password = user.password else {
            completion(.failure(FirebaseError.nilData))
            return
        }
        auth.createUser(withEmail: user.email, password: password) { result, error in
            if let result = result {
                self.networkService.registration(email: user.email, password: password) { resultLocal in
                    switch resultLocal {
                    case .success(let success):
                        self.networkService.authorize(email: user.email, password: password) { resultLocal in
                            switch resultLocal {
                            case .success(let success):
                                completion(.success(result.user))
                                print("log cool")
                            case .failure(let failure):
                                print("log fail: " + failure.localizedDescription)
                            }
                        }
                        print("reg cool")
                    case .failure(let failure):
                        print("reg fail: " + failure.localizedDescription)
                    }
                }
            } else if let error {
                completion(.failure(error))
            }
        }
    }

    func signIn(with user: UserData, completion: @escaping (Result<AuthUserProtocol, Error>) -> Void) {
        guard let password = user.password else {
            completion(.failure(FirebaseError.nilData))
            return
        }
        auth.signIn(withEmail: user.email, password: password) { result, error in
            if let result = result {
                self.networkService.authorize(email: user.email, password: password) { resultLocal in
                    switch resultLocal {
                    case .success(let success):
                        completion(.success(result.user))
                        print("log cool")
                    case .failure(let failure):
                        print("log fail: " + failure.localizedDescription)
                    }
                }
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
