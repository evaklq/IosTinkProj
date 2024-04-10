//
//  StorageService.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation
import FirebaseStorage

final class StorageService: StorageServiceProtocol {
    // MARK: - Declaration objects
    static let shared = StorageService()
    private let referense: StorageReference

    // MARK: - Init
    private init() {
        self.referense = Storage.storage().reference().child(Strings.avatars)
    }

    func changeUserIcon(with userId: String, icon: UIImage, completion: @escaping (Result<URL, any Error>) -> Void) {
        guard let imageData = icon.jpegData(compressionQuality: 0.8) else {
            completion(.failure(UserError.incorrectData))
            return
        }
        let userRef = referense.child(userId)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"

        userRef.putData(imageData, metadata: metaData) { metadata, error in
            guard let _ = metadata else {
                completion(.failure(FirebaseError.nilData))
                return
            }
            if let error = error {
                completion(.failure(error))
            }

            self.getUserIcon(userReferense: userRef) { result in
                switch result {
                case .success(let url):
                    guard let url = url else {
                        completion(.failure(FirebaseError.nilData))
                        return
                    }
                    completion(.success(url))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func getUserIcon(with userId: String? = nil, userReferense: StorageReference? = nil, completion: @escaping (Result<URL?, any Error>) -> Void) {
        var userRef: StorageReference

        if let userReferense = userReferense {
            userRef = userReferense
        } else {
            guard let userId = userId else {
                completion(.failure(UserError.nilData))
                return
            }
            userRef = referense.child(userId)
        }

        userRef.downloadURL { url, error in
            guard let url = url else {
                completion(.success(nil))
                return
            }
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(url))
        }
    }
}
