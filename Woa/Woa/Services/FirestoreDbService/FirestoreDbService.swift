//
//  FirestoreDbService.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation
import FirebaseFirestore

final class FirestoreDbService: FirestoreDbServiceProtocol {
    // MARK: - Declaration objects
    static let shared = FirestoreDbService()
    private let database: CollectionReference

    // MARK: - Init
    private init() {
        self.database = Firestore.firestore().collection(Strings.Firebase.Folder.db)
    }

    func saveUserData(with user: UserData, completion: @escaping (Result<UserData, Error>) -> Void) {
        let documentRef = database.document(user.id)
        documentRef.setData(user.userData, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }

    /// Load data with all user info from firestore database by userId
    func getUserData(with userId: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        let documentRef = database.document(userId)
        documentRef.getDocument { document, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let document = document, document.exists else {
                completion(.failure(FirebaseError.documentDataError))
                return
            }

            let data = document.data()
            let userDataResult = self.arrayToUserData(data, userId)

            switch userDataResult {
            case .success(let userData):
                completion(.success(userData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Support functions
private extension FirestoreDbService {
    /// Create object of UserData from firestore's array with data
    func arrayToUserData(_ data: [String: Any]?, _ userId: String) -> Result<UserData, FirebaseError> {
        guard let data = data else { return .failure(.documentDataError) }
        guard case let .success(nick) = getString(data, "Strings.nick"),
            case let .success(age) = getInt(data, "Strings.age"),
            case let .success(email) = getString(data, "Strings.email"),
            case let .success(iconUrl) = getUrl(data, "Strings.icon") else {
            return .failure(.incorrectData)
        }

        let userData = UserData(nick: nick, email: email, age: age, icon: iconUrl, id: userId)
        return .success(userData)
    }

    /// Get string from Any object
    func getString(_ data: [String: Any], _ name: String) -> Result<String, FirebaseError> {
        guard let stringData = data[name] as? String else {
            return .failure(.incorrectData)
        }
        return .success(stringData)
    }

    /// Get int from Any object
    func getInt(_ data: [String: Any], _ name: String) -> Result<Int, FirebaseError> {
        guard let intData = data[name] as? Int else {
            return .failure(.incorrectData)
        }
        return .success(intData)
    }

    /// Get URL from Any object
    func getUrl(_ data: [String: Any], _ name: String) -> Result<URL?, FirebaseError> {
        guard let urlData = data[name] else {
            return .success(nil)
        }
        guard let urlString = urlData as? String, let url = URL(string: urlString) else {
            return .failure(.incorrectData)
        }
        return .success(url)
    }
}
