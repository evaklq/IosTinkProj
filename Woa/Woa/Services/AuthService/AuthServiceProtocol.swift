//
//  AuthServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation
import FirebaseAuth

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

protocol AuthUserProtocol {
    var id: String { get set }
}
extension User: AuthUserProtocol {
    var id: String {
        get {
            self.uid
        }
        set {
            print("You can't set this property")
        }
    }
}
extension UserData: AuthUserProtocol {}
