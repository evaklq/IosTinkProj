//
//  UserData.swift
//  Woa
//
//  Created by evaklq on 2024-04-07.
//

import Foundation
import FirebaseAuth

struct UserData {
    var nick: String
    var email: String
    var password: String?
    var age: Int
    var iconURL: URL?
    var id: String

    /// For create user first time with password
    init(nick: String, email: String, password: String, age: Int, icon: URL? = nil, id: String) {
        self.nick = nick
        self.email = email
        self.password = password
        self.age = age
        self.iconURL = icon
        self.id = id
    }

    /// For create user data with firebase user
    init(with user: User, nick: String, age: Int, icon: URL?) {
        self.email = user.email ?? ""
        self.id = user.uid
        self.nick = nick
        self.age = age
        self.iconURL = icon
        self.password = nil
    }

    /// For create user data from firebase info
    init(nick: String, email: String, age: Int, icon: URL?, id: String) {
        self.email = email
        self.id = id
        self.nick = nick
        self.age = age
        self.iconURL = icon
        self.password = nil
    }

    /// Get user data in array format
    var userData: [String: Any] {
        var data: [String: Any] = [:]
        data[Strings.nick] = nick
        data[Strings.age] = age
        data[Strings.email] = email
        data[Strings.icon] = iconURL?.absoluteString

        return data
    }

    /*
    /// Get inon in array format
    var iconData: [String: Any] {
        let data: [String: Any] = [Strings.icon: iconId ?? ""]
        return data
    }
    */
}
