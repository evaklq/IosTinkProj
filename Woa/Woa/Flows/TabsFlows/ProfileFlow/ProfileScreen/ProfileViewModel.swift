//
//  ProfileViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ProfileViewModel {
    let currentUser = Observable(UserData(nick: "nick", email: "email", age: 12, icon: nil, id: "2"))
    let image = Observable(UIImage())

    func getUserInfo() {
        image.value = Asset.Assets.example.image
    }
}
