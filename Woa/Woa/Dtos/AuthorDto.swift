//
//  AuthorDto.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import Foundation

struct AuthorDto: Decodable {
    var firstName: String
    var lastName: String
    var biography: String
    var birthDate: Date
    var deathDate: Date?
    var locationId: Int?
}
