//
//  ValidationServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation

enum ValidationErrorType {
    case nick, email, password, age
}

protocol ValidationServiceProtocol {
    func validateUser(nick: String, email: String, password: String, age: Int) -> [ValidationErrorType: [String]]?
}
