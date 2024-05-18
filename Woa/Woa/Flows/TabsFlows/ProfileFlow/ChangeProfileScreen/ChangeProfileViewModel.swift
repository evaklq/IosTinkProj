//
//  ChangeProfileViewModel.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

class ChangeProfileViewModel {
    let currentUser = Observable(UserData(nick: "nick", email: "email", age: 12, icon: nil, id: "2"))
    let image = Observable(UIImage())
    let networkService = NetworkService.shared
    let userDataServise = FirestoreDbService.shared
    let authService = AuthService.shared
    let storageService = StorageService.shared

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
    }

    func startToBeAuthor() {
        let authorDto = AuthorDto(firstName: "Evaklq", lastName: "Evaklq", biography: "bio", birthDate: Date.distantPast)
        networkService.updateRole(with: authorDto, locationId: 1) { result in
            switch result {
            case .success(let success):
                print("cool author")
            case .failure(let failure):
                print("upset author: " + failure.localizedDescription)
            }
        }
    }
}
