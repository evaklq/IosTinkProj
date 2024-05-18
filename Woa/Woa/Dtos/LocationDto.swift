//
//  LocationDto.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import Foundation

struct LocationDto: Decodable {
    var country: String
    var city: String
    var address: String?
}
