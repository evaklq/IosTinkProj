//
//  StorageServiceProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import UIKit
import FirebaseStorage

protocol StorageServiceProtocol {
    func changeUserIcon(with userId: String, icon: UIImage, completion: @escaping (Result<URL, Error>) -> Void)
    func getUserIcon(with userId: String?, userReferense: StorageReference?, completion: @escaping (Result<URL?, any Error>) -> Void)
}
