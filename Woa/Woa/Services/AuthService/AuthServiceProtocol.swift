//
//  AuthServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    associatedtype UserType

    func signUp(with user: UserData, completion: @escaping (Result<UserType, Error>) -> Void)
    func signIn(with user: UserData, completion: @escaping (Result<UserType, Error>) -> Void)
    func signOut()
}

protocol ReadOnlyAuthServiceProtocol: AuthServiceProtocol {
    var currentUser: UserType? { get }
}

/// For create mock services for testing
protocol ReadWriteAuthServiceProtocol: AuthServiceProtocol {
    var currentUser: UserType? { get set }
}
