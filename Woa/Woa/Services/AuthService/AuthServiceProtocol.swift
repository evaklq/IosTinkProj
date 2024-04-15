//
//  AuthServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation

protocol AuthServiceProtocol {
    func signUp(with user: UserData, completion: @escaping (Result<AuthUserProtocol, Error>) -> Void)
    func signIn(with user: UserData, completion: @escaping (Result<AuthUserProtocol, Error>) -> Void)
    func signOut()
}

protocol ReadOnlyAuthServiceProtocol: AuthServiceProtocol {
    var currentUser: AuthUserProtocol? { get }
}

/// For create mock services for testing
protocol ReadWriteAuthServiceProtocol: AuthServiceProtocol {
    var currentUser: AuthUserProtocol? { get set }
}

