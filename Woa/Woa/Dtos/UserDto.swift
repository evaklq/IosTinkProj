//
//  UserDto.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import Foundation

struct UserDto: Decodable {
    var id: Int
    var email: String
    var password: String
    var userRole: UserRoleDto?
    var authorId: Int?
    var author: AuthorDto?
}
