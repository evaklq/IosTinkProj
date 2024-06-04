//
//  FirestoreError.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation

enum FirebaseError: Error {
    case documentDataError, incorrectData, nilData
}

enum UserError: Error {
    case incorrectData, nilData
}
