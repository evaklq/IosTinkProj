//
//  ArtType.swift
//  Woa
//
//  Created by evaklq on 2024-04-17.
//

import Foundation

enum ArtType: String {
    case picture
    case sculpture
    case photo
    case graphics
    case artObject

    var description: String {
        switch self {
        case .picture:
            return Strings.Title.picture
        case .sculpture:
            return Strings.Title.sculpture
        case .photo:
            return Strings.Title.photo
        case .graphics:
            return Strings.Title.graphics
        case .artObject:
            return Strings.Title.artObject
        }
    }
}
