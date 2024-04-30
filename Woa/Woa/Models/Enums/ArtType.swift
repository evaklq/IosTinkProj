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
            return "Picture"
        case .sculpture:
            return "Sculpture"
        case .photo:
            return "Photo"
        case .graphics:
            return "Graphics"
        case .artObject:
            return "Art Object"
        }
    }
}
