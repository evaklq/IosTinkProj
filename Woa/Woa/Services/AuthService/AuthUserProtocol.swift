//
//  AuthUserProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-15.
//

import Foundation
import FirebaseAuth

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
