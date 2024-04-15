//
//  FirestoreDbServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation

protocol FirestoreDbServiceProtocol {
    func saveUserData(with user: UserData, completion: @escaping (Result<UserData, Error>) -> Void)
    func getUserData(with id: String, completion: @escaping (Result<UserData, Error>) -> Void)
}
