//
//  ProfileViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ProfileViewModel {
    let currentUser = Observable(UserData(nick: "nick", email: "email", age: 12, icon: nil, id: "2"))
    let update = Observable(false)
    let image = Observable(UIImage())
    let userDataServise = FirestoreDbService.shared
    let authService = AuthService.shared
    let storageService = StorageService.shared
    let networkService = NetworkService.shared

    func getUserInfo() {
        let userId = authService.currentUser?.id ?? ""
        userDataServise.getUserData(with: userId) { result in
            switch result {
            case .success(let user):
                self.currentUser.value = user
                self.image.value = Asset.Assets.example.image
            case .failure(let failure):
                print(failure)
            }
        }
        image.value = Asset.Assets.example.image
    }

    func createArt() {
        networkService.createArt { result in
            switch result {
            case .success(let user):
                self.update.value = true
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
